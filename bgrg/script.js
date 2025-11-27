/**
 * BGRG - Bergen Giardia Research Group
 * Interactive functionality
 */

(function() {
    'use strict';

    // Wait for DOM to be ready
    document.addEventListener('DOMContentLoaded', function() {
        initMobileNavigation();
        initSmoothScrolling();
        initActiveNavigation();
    });

    /**
     * Mobile Navigation Toggle
     */
    function initMobileNavigation() {
        const navToggle = document.querySelector('.nav-toggle');
        const navList = document.querySelector('.nav-list');

        if (!navToggle || !navList) return;

        navToggle.addEventListener('click', function() {
            const isExpanded = navToggle.getAttribute('aria-expanded') === 'true';

            navToggle.setAttribute('aria-expanded', !isExpanded);
            navList.classList.toggle('active');
        });

        // Close mobile menu when clicking on a link
        const navLinks = navList.querySelectorAll('a');
        navLinks.forEach(function(link) {
            link.addEventListener('click', function() {
                if (window.innerWidth < 768) {
                    navToggle.setAttribute('aria-expanded', 'false');
                    navList.classList.remove('active');
                }
            });
        });

        // Close mobile menu when resizing to desktop
        window.addEventListener('resize', function() {
            if (window.innerWidth >= 768) {
                navToggle.setAttribute('aria-expanded', 'false');
                navList.classList.remove('active');
            }
        });
    }

    /**
     * Smooth Scrolling for Anchor Links
     */
    function initSmoothScrolling() {
        const navLinks = document.querySelectorAll('a[href^="#"]');

        navLinks.forEach(function(link) {
            link.addEventListener('click', function(e) {
                const targetId = this.getAttribute('href');

                // Skip if it's just "#"
                if (targetId === '#') return;

                const targetElement = document.querySelector(targetId);

                if (targetElement) {
                    e.preventDefault();

                    // Get the header height for offset
                    const navHeight = document.querySelector('.main-nav').offsetHeight;
                    const targetPosition = targetElement.offsetTop - navHeight - 20;

                    window.scrollTo({
                        top: targetPosition,
                        behavior: 'smooth'
                    });

                    // Update URL without scrolling
                    history.pushState(null, null, targetId);

                    // Focus on the target element for accessibility
                    targetElement.setAttribute('tabindex', '-1');
                    targetElement.focus();
                }
            });
        });
    }

    /**
     * Active Navigation Based on Scroll Position
     */
    function initActiveNavigation() {
        const sections = document.querySelectorAll('main section[id]');
        const navLinks = document.querySelectorAll('.nav-list a[href^="#"]');

        if (sections.length === 0 || navLinks.length === 0) return;

        function updateActiveNavigation() {
            const scrollPosition = window.scrollY + 150;

            sections.forEach(function(section) {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.offsetHeight;
                const sectionId = section.getAttribute('id');

                if (scrollPosition >= sectionTop && scrollPosition < sectionTop + sectionHeight) {
                    navLinks.forEach(function(link) {
                        link.classList.remove('active');

                        if (link.getAttribute('href') === '#' + sectionId) {
                            link.classList.add('active');
                        }
                    });
                }
            });
        }

        // Update on scroll
        let scrollTimeout;
        window.addEventListener('scroll', function() {
            if (scrollTimeout) {
                window.cancelAnimationFrame(scrollTimeout);
            }
            scrollTimeout = window.requestAnimationFrame(updateActiveNavigation);
        });

        // Update on load
        updateActiveNavigation();
    }

})();
