# BGRG Website Modernization

## Overview
The Bergen Giardia Research Group website has been modernized with a focus on responsive design, accessibility (WCAG 2.1), and modern web standards.

## What Was Changed

### 1. HTML Structure (index.html)
- **Modern HTML5**: Replaced old HTML4/VML markup with semantic HTML5
- **Semantic Elements**: Used proper `<header>`, `<nav>`, `<main>`, `<section>`, `<footer>` tags
- **Accessibility Features**:
  - Skip to main content link for keyboard navigation
  - Proper heading hierarchy (h1, h2)
  - ARIA labels for navigation
  - Alt text for all images
  - Language attributes
- **Meta Tags**: Added viewport meta tag for mobile responsiveness
- **Single Page Design**: Consolidated all sections into one page with anchor navigation

### 2. CSS Styling (style.css)
- **Responsive Design**: Mobile-first approach with breakpoints at 768px and 1024px
- **Modern Layout**: CSS Grid and Flexbox for flexible layouts
- **WCAG Compliance**:
  - High contrast color ratios (minimum 4.5:1 for normal text)
  - Clear focus states with visible outlines
  - Sufficient touch target sizes (min 44x44px)
- **Accessibility Features**:
  - Support for reduced motion preferences
  - Support for high contrast mode
  - Print-friendly styles
- **Modern Colors**:
  - Primary: #2c3e50 (dark blue-grey)
  - Accent: #cc9933 (gold)
  - Background: #fff with alternating #f9f9f9 sections
- **Typography**: System font stack for optimal performance
- **Smooth Transitions**: For interactive elements

### 3. JavaScript (script.js)
- **Mobile Navigation**: Hamburger menu for mobile devices
- **Smooth Scrolling**: Enhanced navigation experience
- **Active State**: Highlights current section in navigation
- **Accessible**: Properly manages focus and ARIA states
- **Performance**: Uses requestAnimationFrame for scroll events

## Browser Compatibility
- Modern browsers (Chrome, Firefox, Safari, Edge)
- IE11 and older browsers not supported (can be added if needed)

## Accessibility Features (WCAG 2.1 AA Compliance)

### Perceivable
- ✅ Semantic HTML structure
- ✅ Alt text for images
- ✅ Sufficient color contrast
- ✅ Responsive text sizing

### Operable
- ✅ Keyboard navigation support
- ✅ Skip to main content link
- ✅ Clear focus indicators
- ✅ No time limits on content
- ✅ Touch targets at least 44x44px

### Understandable
- ✅ Clear navigation structure
- ✅ Descriptive page title
- ✅ Consistent navigation
- ✅ Language attribute specified

### Robust
- ✅ Valid HTML5
- ✅ ARIA labels where appropriate
- ✅ Works with assistive technologies

## Responsive Breakpoints
- **Mobile**: < 768px (stacked layout, hamburger menu)
- **Tablet**: 768px - 1023px (adjusted spacing)
- **Desktop**: ≥ 1024px (full layout)

## Files Created
- `index.html` - Modern HTML structure
- `style.css` - Responsive stylesheet
- `script.js` - Interactive functionality
- `index.html.backup` - Backup of original file

## Original Content Preserved
- All text content from the home page
- Links to original sub-pages (Background, Research Projects, etc.)
- Contact information
- Norwegian language link
- All images

## Next Steps (Optional)
1. Extract content from sub-pages (Page392.htm, Page449.htm, etc.) and integrate into sections
2. Add more images or graphics
3. Implement a content management system if frequent updates are needed
4. Add analytics tracking
5. Optimize images for web (compress, convert to WebP)

## Testing Checklist
- [x] Mobile responsive (320px to 1920px)
- [x] Tablet responsive
- [x] Desktop responsive
- [x] Keyboard navigation
- [x] Screen reader compatibility
- [x] Color contrast
- [x] Focus states
- [x] Print styles
- [x] Cross-browser compatibility

## Performance
- Minimal dependencies (no external libraries)
- Fast load time
- Efficient CSS and JavaScript
- Optimized for Core Web Vitals

## Notes
- The website now uses a single-page design for better user experience
- Original sub-pages are still accessible via links
- The design is intentionally clean and professional (not overly fancy)
- All modifications follow web accessibility guidelines
