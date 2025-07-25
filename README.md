# SmartFIT Golf Grip Survey

A comprehensive, mobile-first golf grip fitting survey built with HTML5, CSS3, and vanilla JavaScript.

## 🎯 Overview

SmartFIT is an interactive survey application designed to collect detailed information from golfers to provide personalized grip recommendations. The app features a native mobile experience with smooth animations, intuitive navigation, and comprehensive data collection.

## 🚀 Live Demo

**GitHub Pages:** https://cnmcdona.github.io/SmartFIT/

## 📱 Features

### **User Experience**
- **Mobile-first design** with native app feel
- **No scrolling** - content fits perfectly to device screen
- **Smooth page transitions** with fade animations
- **Progress indicator** with dynamic dots
- **Responsive design** optimized for all devices

### **Survey Components**
- **Welcome screen** with brand introduction
- **Section introductions** with clear navigation
- **Multiple question types:**
  - Sliding toggles (age, handicap, rounds)
  - Radio button selections (gender, swing hand)
  - Checkbox selections (physical conditions, improvements)
  - Text input with autocomplete (grip models)
- **Photo capture** for hand measurements
- **Progress tracking** throughout the survey

### **Technical Features**
- **Brand-consistent design** with custom color palette
- **Nunito font** throughout the application
- **Touch-optimized** interactions for mobile
- **Accessibility features** with keyboard navigation
- **Cross-browser compatibility**

## 🎨 Design System

### **Color Palette**
- **Primary Green:** `#2DD28F`
- **Core Black:** `#333333`
- **Neutral White:** `#FFFFFF`
- **Light Grey:** `#E5E5EA`
- **Accent Blue:** `#5AC8FA`

### **Typography**
- **Font Family:** Nunito (Google Fonts)
- **Weights:** 300, 400, 500, 600, 700

### **Components**
- **Buttons:** Primary (blue), Secondary (grey)
- **Sliders:** Custom styled with brand colors
- **Progress Dots:** Dynamic state indicators
- **Option Cards:** Radio/checkbox selections

## 📋 Survey Structure

### **Section 1: Player Profile**
1. Age selection (slider)
2. Gender selection
3. Handicap range (slider)
4. Rounds per year (slider)
5. Current grip size
6. Current grip model (with autocomplete)

### **Section 2: Physical Considerations**
7. Physical conditions (checkboxes)
8. Moisture control needs
9. Current grip feel
10. Swing hand preference
11. Iron shot shape (slider)
12. Driver shot shape (slider)

### **Section 3: Goals**
13. Iron shot shape changes
14. Driver shot shape changes
15. Grip improvements (checkboxes)

### **Section 4: Hand Measurements**
16. Hand measurement instructions
17. Photo capture interface

## 🛠 Technical Stack

- **HTML5** - Semantic markup
- **CSS3** - Modern styling with Flexbox/Grid
- **Vanilla JavaScript** - No frameworks, lightweight
- **GitHub Pages** - Hosting and deployment
- **Google Fonts** - Typography
- **Font Awesome** - Icons

## 📁 File Structure

```
SmartFIT/
├── index.html          # Main application file
├── README.md          # Project documentation
├── manifest.json      # PWA manifest
└── .gitignore        # Git ignore rules
```

## 🚀 Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/cnmcdona/SmartFIT.git
   cd SmartFIT
   ```

2. **Open in browser:**
   ```bash
   # Using Python
   python -m http.server 8000
   
   # Using Node.js
   npx serve .
   
   # Or simply open index.html in your browser
   ```

3. **Access the app:**
   - Local: `http://localhost:8000`
   - Live: `https://cnmcdona.github.io/SmartFIT/`

## 📊 Data Collection

The survey collects comprehensive data including:
- **Demographics:** Age, gender
- **Golf Profile:** Handicap, playing frequency
- **Current Equipment:** Grip size, model
- **Physical Considerations:** Conditions, preferences
- **Shot Analysis:** Iron and driver shot shapes
- **Goals:** Desired improvements
- **Hand Measurements:** Photo capture for sizing

## 🔧 Customization

### **Adding New Questions**
1. Add HTML structure in the appropriate section
2. Update JavaScript navigation logic
3. Add any required CSS styling
4. Test on mobile devices

### **Modifying Brand Colors**
Update CSS custom properties in the main stylesheet:
```css
:root {
  --primary-green: #2DD28F;
  --accent-blue: #5AC8FA;
  --core-black: #333333;
  --neutral-white: #FFFFFF;
  --light-grey: #E5E5EA;
}
```

### **Adding New Question Types**
The app supports multiple input types:
- Sliders with custom styling
- Radio buttons with visual feedback
- Checkboxes with multi-select
- Text input with autocomplete
- Photo capture with camera access

## 📱 Mobile Optimization

- **Viewport meta tags** for proper scaling
- **Touch-friendly** button sizes (44px minimum)
- **Safe area insets** for iPhone compatibility
- **Smooth scrolling** with momentum
- **Native app feel** with full-screen layout

## 🔒 Privacy & Security

- **No external dependencies** for data collection
- **Client-side only** processing
- **No analytics tracking** by default
- **Secure by design** with minimal attack surface

## 🚀 Deployment

The app is currently deployed on **GitHub Pages** and automatically updates when changes are pushed to the main branch.

### **Custom Domain Setup**
1. Add CNAME file to repository
2. Configure DNS settings
3. Update GitHub Pages settings

## 📈 Future Enhancements

### **Planned Features**
- [ ] Backend integration for data storage
- [ ] User authentication system
- [ ] Admin dashboard for results
- [ ] Email integration for recommendations
- [ ] Advanced analytics and reporting

### **Technical Improvements**
- [ ] Progressive Web App (PWA) features
- [ ] Offline functionality
- [ ] Performance optimizations
- [ ] Enhanced accessibility
- [ ] Multi-language support

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly on mobile devices
5. Submit a pull request

## 📞 Support

For technical questions or feature requests, please contact the development team.

---

**Built with ❤️ for the golf community** 