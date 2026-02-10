#!/bin/bash
set -e

# Recursa-aligned branding loop runner
# Runs Claude Code in a Docker sandbox following the self-improving framework
#
# Features:
#   - Loads core Recursa documents (SOUL, CONSTITUTION, LOOP, LEARNING)
#   - Tracks total iteration count across runs
#   - Triggers meso retrospectives every 5 iterations
#   - Triggers macro reviews every 20 iterations
#   - Integrates with audit logging and memory systems
#
# Usage: ./run-loop.sh [N]  (default N=5)

N=${1:-5}
DIR="/vol1/workspace/recursa-branding"
LOG_DIR="$DIR/logs"
IMAGE_NAME="claude-sandbox"
CONTAINER_NAME="branding-loop"
ITERATION_FILE="$DIR/.iteration_count"
mkdir -p "$LOG_DIR"

# Track iteration count across runs for meso/macro cycles
if [ -f "$ITERATION_FILE" ]; then
    TOTAL_ITERATIONS=$(cat "$ITERATION_FILE")
else
    TOTAL_ITERATIONS=0
fi

# Recursa-aligned prompt for self-improving branding loop
read -r -d '' PROMPT << 'EOF' || true
You are the Recursa Brand Engine, a self-improving branding system for the Recursa framework.

## Startup (Every Iteration)
1. Read system/SOUL.md for brand identity and values
2. Read system/CONSTITUTION.md for brand constraints (NEVER violate)
3. Read docs/LOOP.md for the iteration process
4. Check memory/scratchpad.md for context from previous iteration
5. Consult docs/LEARNING.md for accumulated brand knowledge
6. Review docs/GOALS.md for current priorities

## This Iteration
Run one complete iteration cycle: DEFINE → CREATE → REVIEW → SHIP → LEARN

**Asset Types** (pick one per iteration based on GOALS.md priorities):
- Visual: Logo variants, icons, illustrations, social graphics
- Copy: Taglines, descriptions, social posts, announcements
- Web: Website pages, components, styling improvements
- Template: Email templates, social post templates, slide decks
- Documentation: Style guide updates, brand guideline refinements

**Emphasis**: Quality and brand consistency over quantity.
- Check STYLE.md for visual/verbal standards before creating
- Check IDENTITY.md for voice and personality
- Check SOCIAL.md for platform-specific guidelines
- Check COPY.md for standard copy to reference

## Documentation Requirements (Per CONSTITUTION.md)
- Log discoveries to docs/LEARNING.md
- Update docs/METRICS.md with iteration stats
- Log significant actions to guardrails/audit/action_log.jsonl
- Use memory/scratchpad.md for working notes

## Review Cycles
- Every 5th iteration: Meso retrospective (review last 5 assets, patterns)
- Every 20th iteration: Macro review (comprehensive brand audit)

## End of Iteration
Before finishing:
1. Ensure asset is saved to appropriate deliverables/ folder
2. Update scratchpad.md with context for next iteration
3. Verify all documentation updated per CONSTITUTION.md requirements
4. If web asset, test in browser before marking complete
EOF

cd "$DIR"

# Archive old logs instead of deleting
ARCHIVE_DIR="$LOG_DIR/archive"
mkdir -p "$ARCHIVE_DIR"
if ls "$LOG_DIR"/*.log "$LOG_DIR"/*.json 1>/dev/null 2>&1; then
    ARCHIVE_DATE=$(date +%Y%m%d-%H%M%S)
    ARCHIVE_FILE="$ARCHIVE_DIR/logs-$ARCHIVE_DATE.tar.gz"
    tar -czf "$ARCHIVE_FILE" -C "$LOG_DIR" --exclude='archive' *.log *.json 2>/dev/null || true
    rm -f "$LOG_DIR"/*.log "$LOG_DIR"/*.json
    echo "Archived previous logs to $ARCHIVE_FILE"
fi

# Clean up archives older than 30 days
find "$ARCHIVE_DIR" -name "*.tar.gz" -mtime +30 -delete 2>/dev/null || true

# Build the sandbox image if it doesn't exist
if ! docker image inspect "$IMAGE_NAME" &>/dev/null; then
    echo "Building sandbox image..."
    docker build -t "$IMAGE_NAME" -f Dockerfile.sandbox .
fi

for ((i=1; i<=N; i++)); do
    # Increment total iteration count
    TOTAL_ITERATIONS=$((TOTAL_ITERATIONS + 1))
    echo "$TOTAL_ITERATIONS" > "$ITERATION_FILE"

    # Determine cycle type
    CYCLE_TYPE="micro"
    CYCLE_PROMPT=""
    if ((TOTAL_ITERATIONS % 20 == 0)); then
        CYCLE_TYPE="macro"
        CYCLE_PROMPT="

## MACRO REVIEW CYCLE (Iteration #$TOTAL_ITERATIONS)
This is a MACRO review iteration. Before creative work:
1. Perform comprehensive brand audit
2. Review all assets created in last 20 iterations
3. Analyze brand consistency, identify drift
4. Consolidate learnings, update LEARNING.md
5. Review and update GOALS.md for next phase
6. Update journal/reflections/ with major review
7. Then proceed with one high-priority asset"
    elif ((TOTAL_ITERATIONS % 5 == 0)); then
        CYCLE_TYPE="meso"
        CYCLE_PROMPT="

## MESO RETROSPECTIVE (Iteration #$TOTAL_ITERATIONS)
This is a MESO retrospective iteration. Before creative work:
1. Review last 5 assets created
2. Check brand consistency across recent work
3. Update docs/METRICS.md with trends
4. Promote observations to patterns in LEARNING.md
5. Then proceed with normal iteration"
    fi

    # Build iteration-specific prompt
    ITER_PROMPT="$PROMPT

## Current State
- Session iteration: $i of $N
- Total iterations: #$TOTAL_ITERATIONS
- Cycle type: $CYCLE_TYPE$CYCLE_PROMPT"

    TIMESTAMP=$(date +%Y%m%d-%H%M%S)
    LOG="$LOG_DIR/loop-$TIMESTAMP.log"
    echo "=== Iteration $i of $N (Total: #$TOTAL_ITERATIONS, Cycle: $CYCLE_TYPE) ===" >> "$LOG"
    LOG_JSON="$LOG_DIR/loop-$TIMESTAMP.json"
    touch "$LOG_JSON"
    echo "Starting iteration at $(date)" >> "$LOG"
    echo "Working directory: $DIR" >> "$LOG"
    echo "Cycle type: $CYCLE_TYPE" >> "$LOG"

    # Start background parser that tails the raw JSON and writes readable output
    (
        tail -f "$LOG_JSON" 2>/dev/null | while IFS= read -r line; do
            # Extract assistant text messages
            text=$(echo "$line" | jq -r 'select(.type=="assistant") | .message.content[]? | select(.type=="text") | .text // empty' 2>/dev/null)
            [ -n "$text" ] && echo "$text" >> "$LOG"
            # Extract tool calls
            tool=$(echo "$line" | jq -r 'select(.type=="assistant") | .message.content[]? | select(.type=="tool_use") | "[\(.name)] \(.input | tostring | .[0:200])"' 2>/dev/null)
            [ -n "$tool" ] && echo "$tool" >> "$LOG"
        done
    ) &
    PARSER_PID=$!

    # Force remove any previous container before starting new one
    docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

    # Build docker args as an array
    DOCKER_ARGS=(-d --name "$CONTAINER_NAME" --network host)
    DOCKER_ARGS+=(-v /vol1/workspace/recursa-branding:/vol1/workspace/recursa-branding)
    DOCKER_ARGS+=(-v /vol1/workspace/recursa:/vol1/workspace/recursa)
    DOCKER_ARGS+=(-v "$HOME/.claude:/home/node/.claude")
    DOCKER_ARGS+=(-v "$HOME/.config/claude:/home/node/.config/claude")
    DOCKER_ARGS+=(-w /vol1/workspace/recursa-branding)

    CLAUDE_ARGS=(-p "$ITER_PROMPT" --dangerously-skip-permissions --verbose --output-format stream-json)

    # Run container in detached mode
    CONTAINER_ID=$(docker run "${DOCKER_ARGS[@]}" "$IMAGE_NAME" "${CLAUDE_ARGS[@]}" 2>&1)

    if [ -z "$CONTAINER_ID" ] || ! docker ps -q --filter "id=$CONTAINER_ID" | grep -q .; then
        echo "ERROR: Container failed to start: $CONTAINER_ID" >> "$LOG"
        sleep 10
        continue
    fi

    echo "Container started: $CONTAINER_ID" >> "$LOG"

    # Stream container output to log file in background
    docker logs -f "$CONTAINER_NAME" >> "$LOG_JSON" 2>&1 &
    LOGS_PID=$!

    # Wait for container to finish
    EXIT_CODE=$(docker wait "$CONTAINER_ID" 2>&1)
    echo "Container exited with code: $EXIT_CODE" >> "$LOG"

    # Stop the log streaming and parser
    kill $LOGS_PID 2>/dev/null || true
    kill $PARSER_PID 2>/dev/null || true

    # Clean up container
    docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

    echo "Iteration $i of $N complete at $(date)" >> "$LOG"
    sleep 5
done

echo "All $N iterations complete. Total iterations to date: $TOTAL_ITERATIONS"
echo "Next meso retrospective: iteration #$(( (TOTAL_ITERATIONS / 5 + 1) * 5 ))"
echo "Next macro review: iteration #$(( (TOTAL_ITERATIONS / 20 + 1) * 20 ))"
