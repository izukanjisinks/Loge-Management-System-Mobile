# Design System Document

## 1. Overview & Creative North Star

### Creative North Star: "The Digital Concierge"
This design system is built to evoke the tactile luxury of a high-end wilderness retreat. It moves away from the cold, clinical nature of standard utility apps, adopting an **Editorial Organic** aesthetic. We achieve this by prioritizing "breathing room," intentional asymmetry, and a focus on materiality.

The system rejects the "boxed-in" feeling of traditional mobile apps. Instead, it treats the screen as a canvas of fine stationery where elements are layered naturally. We use high-contrast typography scales—pairing a statuesque serif with a functional, modern sans-serif—to guide the guest’s eye through their stay with the same grace as a physical concierge.

---

## 2. Colors

The palette is a sophisticated blend of earthen minerals and forest tones, designed to reduce eye strain and promote a sense of calm.

### Color Tokens
- **Primary (`#502c17`):** Use for high-level branding and primary actions. It represents the deep timber of the lodge.
- **Secondary (`#476363`):** A muted forest green for secondary actions and supportive UI elements.
- **Surface (`#fff8f1`):** A soft cream background that feels warmer and more premium than pure white.
- **Accent/Tertiary (`#38352f`):** Charcoal earth for high-contrast text and grounding elements.

### The "No-Line" Rule
To maintain an editorial feel, **1px solid borders are prohibited for sectioning.** Boundaries must be defined through:
- **Background Shifts:** Transitioning from `surface` to `surface-container-low`.
- **Vertical Rhythm:** Using generous whitespace to imply separation.
- **Tonal Contrast:** Nesting a `surface-container-lowest` card inside a `surface-container` background.

### The "Glass & Gradient" Rule
For floating elements like "Book Now" bars or navigation overlays, use **Glassmorphism**. Apply a semi-transparent version of the surface color with a `backdrop-blur` (12px–20px). This ensures the UI feels like a lens over the lodge experience, not a barrier.

---

## 3. Typography

The typographic system creates an authoritative yet welcoming voice by balancing the heritage of **Noto Serif** with the precision of **Manrope**.

- **Display & Headlines (Noto Serif):** Used for "moment-driven" text—room names, welcome greetings, and section titles. The high x-height and elegant serifs communicate luxury.
- **Body & Labels (Manrope):** Used for all functional data. Manrope’s geometric clarity ensures legibility even at small sizes (e.g., `label-sm`) for amenity lists and pricing.

**Hierarchy Strategy:**
- Use `display-lg` for hero impact, often slightly offset or asymmetric to break the grid.
- Body text should never feel cramped; maintain a line height of at least 1.5 for `body-md` to ensure a premium reading experience.

---

## 4. Elevation & Depth

We move away from the "drop shadow" era toward **Tonal Layering**.

### The Layering Principle
Depth is achieved by stacking surface tokens. For a mobile dashboard:
1. **Base Layer:** `surface` (`#fff8f1`)
2. **Section Layer:** `surface-container-low` (`#fbf3e5`)
3. **Interactive Cards:** `surface-container-lowest` (`#ffffff`)

### Ambient Shadows
If an element must float (like a FAB or a modal):
- **Blur:** 24px to 40px.
- **Opacity:** 4%–8%.
- **Tint:** Use a dark variant of the `primary` or `on-surface` color (avoid pure black shadows).

### The "Ghost Border"
When accessibility requires a boundary, use a "Ghost Border": the `outline-variant` token at **15% opacity**. This provides a hint of structure without interrupting the organic flow of the cream background.

---

## 5. Components

### Buttons
- **Primary:** `primary` background with `on-primary` text. Use `rounded-md` (0.75rem).
- **Secondary:** `surface-container-highest` background. No border.
- **Tertiary:** Text-only in `primary` color, used for low-emphasis actions like "View Details."

### Cards & Lists
- **Rule:** **Strictly no dividers.** 
- Separate list items using a `surface-container-low` background on the parent and `surface-container-lowest` on the child cards, or simply use 16px–24px of vertical whitespace.
- Cards should use `rounded-lg` (1rem) to feel approachable.

### Input Fields
- Avoid the "boxed" look. Use a `surface-container` background with a subtle bottom-border in `outline-variant` (20% opacity). When focused, the bottom border transitions to `primary`.

### Navigation (The Signature Bar)
The bottom navigation should be a floating glass element (`backdrop-blur`) with `rounded-xl` corners, sitting 16px away from the screen edges. This reinforces the "mobile-first" and "custom-built" nature of the companion app.

---

## 6. Do's and Don'ts

### Do
- **Do** use intentional asymmetry. Place a headline on the left and a small sub-caption offset to the right.
- **Do** use "Soft Shadows" that mimic natural ambient light.
- **Do** treat photography as a UI element. Crop images with `rounded-lg` to match the component language.
- **Do** ensure all interactive touch targets are at least 44x44px, despite the "minimal" look.

### Don't
- **Don't** use 100% black (`#000000`). Use `on-surface` (`#1f1b13`) for all "black" text to maintain the earthy warmth.
- **Don't** use standard "Material Design" blue or purple for links; stay within the `primary` (brown) and `secondary` (green) spectrum.
- **Don't** use sharp 90-degree corners. Everything should have at least a `sm` (0.25rem) radius to feel "welcoming."
- **Don't** over-shadow. If three elements are on the same plane, they should have the same tonal background, not three different shadows.