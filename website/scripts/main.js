/**
 * Recursa Website JavaScript
 * Minimal interactivity for navigation and smooth scrolling
 */

(function() {
    'use strict';

    // Mobile navigation toggle
    const navToggle = document.querySelector('.nav-toggle');
    const navLinks = document.querySelector('.nav-links');

    if (navToggle && navLinks) {
        navToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            navToggle.classList.toggle('active');
        });

        // Close mobile nav when clicking a link
        navLinks.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                navLinks.classList.remove('active');
                navToggle.classList.remove('active');
            });
        });
    }

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;

            const target = document.querySelector(targetId);
            if (target) {
                e.preventDefault();
                const navHeight = document.querySelector('.nav')?.offsetHeight || 0;
                const targetPosition = target.getBoundingClientRect().top + window.pageYOffset - navHeight - 20;

                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Active nav link highlighting for docs page
    const docsNav = document.querySelector('.docs-nav');
    if (docsNav) {
        const sections = document.querySelectorAll('.docs-content h2[id]');
        const navItems = docsNav.querySelectorAll('a');

        const highlightNav = () => {
            const scrollPos = window.scrollY + 150;

            sections.forEach((section, index) => {
                const top = section.offsetTop;
                const bottom = top + section.offsetHeight;

                if (scrollPos >= top && scrollPos < bottom) {
                    navItems.forEach(item => item.classList.remove('active'));
                    navItems[index]?.classList.add('active');
                }
            });
        };

        window.addEventListener('scroll', highlightNav);
        highlightNav();
    }

    // Add subtle animation on scroll
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-fade-in-up');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Observe elements that should animate in
    document.querySelectorAll('.feature, .example, .benefit').forEach(el => {
        el.style.opacity = '0';
        observer.observe(el);
    });

    // Console easter egg
    console.log('%c∞ Recursa', 'font-size: 24px; font-weight: bold; color: #4F46E5;');
    console.log('%cSystems that learn to improve themselves.', 'font-size: 14px; color: #64748B;');
    console.log('%chttps://github.com/dhuree/recursa', 'font-size: 12px; color: #94A3B8;');

})();
