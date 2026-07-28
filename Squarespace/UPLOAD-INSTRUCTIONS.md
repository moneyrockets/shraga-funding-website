# Shraga Funding — Squarespace Upload Guide

Domain: **shragafunding.com**
Method: All-in-One Code Block (same pattern as the AI Collections Group and Savoy sites)
Theme: Light & clean · Blueprint blue + steel · Direct lender · Full product range

---

## Files in this folder

| # | File | Where it goes in Squarespace |
|---|------|------------------------------|
| 1 | `1-header-code-injection.html` | Settings → Advanced → Code Injection → **HEADER** |
| 2 | `shraga-home-all-in-one.html` | Homepage → blank section → **Code Block** |
| 3 | `privacy-policy-code-block.html` | New page `/privacy-policy` → Code Block |
| 4 | `terms-of-use-code-block.html` | New page `/terms-of-use` → Code Block |

---

## BEFORE YOU UPLOAD — fill in the placeholders

Every placeholder is wrapped in double square brackets `[[ ]]`. Do a find-and-replace
in each file (TextEdit → Edit → Find → Replace) for these:

| Placeholder | Replace with |
|---|---|
| `[[(000) 000-0000]]` | Your real phone number |
| `+10000000000` | Your phone in `tel:` format, e.g. `+12125551234` (in the href attributes) |
| `[[info@shragafunding.com]]` | Your real inbound email |
| `[[123 Main Street, City, ST 00000]]` | Your mailing address |
| `[[2026]]` | Current copyright year |
| `[[Month DD, 2026]]` | "Last updated" date on the legal pages |
| `[[Client name]]` / `[[Owner, ...]]` | A real client testimonial, or delete the Client Story section |

> The legal pages use your exact ShopFunder Privacy Policy + Terms of Use, rebranded to
> **Shraga Funding LLC**, with **New York** governing law (as in your originals). Contact
> details in them use the same `[[ ]]` placeholders — fill them the same way.

> Tip: open a file, Cmd+A to select all, and eyeball for `[[` before pasting. If you
> see any bracket left, it hasn't been filled in.

---

## Step 1 — Header Code Injection

1. Log into Squarespace → open your **shragafunding.com** site.
2. Settings → Advanced → **Code Injection**.
3. Open `1-header-code-injection.html` in TextEdit → Cmd+A → Cmd+C.
4. Paste into the **HEADER** field. Save.

Loads fonts (Space Grotesk, Inter, JetBrains Mono), favicons + OG meta, and hides
Squarespace's default header/footer/announcement chrome.

---

## Step 2 — Homepage

1. **Pages** → make sure you have a homepage (click "+" → Blank Page → name "Home" → set as homepage).
2. Click **Edit** on the homepage.
3. Click **+** → add a **Blank Section**.
4. Inside that section, click **+** → choose **Code**.
5. **IMPORTANT: turn OFF "Display Source"** in the code block toolbar.
6. Open `shraga-home-all-in-one.html` in TextEdit → Cmd+A → Cmd+C.
7. Paste into the code block → Apply → Save.

---

## Step 3 — Privacy Policy Page

1. **Pages** → "+" → Blank Page → name it **"Privacy Policy"**.
2. Gear icon next to the page → set **URL slug** to `privacy-policy` (EXACT — footer links 404 otherwise).
3. Edit → + → Code Block → turn OFF "Display Source".
4. Paste all of `privacy-policy-code-block.html` → Apply → Save.

## Step 4 — Terms of Use Page

Repeat Step 3, but:
- Name the page **"Terms of Use"**
- URL slug: `terms-of-use` (EXACT)
- Paste `terms-of-use-code-block.html`

Both legal pages cross-link and have a "← Back to Home" button that routes to `/`.

---

## Step 5 — Hide default Squarespace chrome

The CSS already hides most of it, but for safety:

1. Design → **Site Header** → simplest/smallest option (or toggle off).
2. Design → **Site Footer** → remove all footer content.
3. Settings → **Marketing** → disable any announcement bars.

---

## Step 6 — Favicon (already embedded — nothing to upload)

The real metallic "S" favicon is embedded as a data URI inside
`1-header-code-injection.html`, so the browser-tab icon works automatically once
Step 1 is done. (Optional: Design → **Browser Icon** → upload
`logos/icon-512.png` as a belt-and-suspenders fallback.)

---

## Step 7 — Activate the application form (one-time FormSubmit verification)

The "Get funded" form posts to **FormSubmit.co**, which forwards submissions to the
email you set in `[[info@shragafunding.com]]`. It needs a one-time activation:

1. After Step 2 is live, open the site and submit the form with a test entry.
2. It flips to "Application received."
3. Check that inbox — FormSubmit sends a verification email with an **"Activate this form"** button.
4. Click it. Every submission from then on emails you directly.

No account, no API key, no monthly fee. The honeypot spam trap is already wired in.

> **Alternative: external application portal.** If you'd rather send "Apply Now"
> to an outside application URL instead of the on-page form, replace every
> `href="#apply"` in `shraga-home-all-in-one.html` with your portal URL, e.g.
> `href="https://apply.shragafunding.com"`. You can then delete the form column
> in the Apply section if you don't want the on-page form at all.

---

## Step 8 — Test (incognito window)

- [ ] Hero logo + "Capital that's ready to break ground" renders
- [ ] Nav links smooth-scroll to Solutions, How It Works, Why Shraga, FAQ
- [ ] "Apply Now" / "Get funded" scroll to the application form
- [ ] Stats bar shows $10M+ / 24 hrs / 8 / 100%
- [ ] Solutions grid shows all products, Construction Loans card highlighted
- [ ] FAQ items open/close on click
- [ ] Form submits → flips to "Application received" → email arrives
- [ ] Phone link dials your number; email link opens mail
- [ ] Footer Privacy Policy → `/privacy-policy`; Terms → `/terms-of-use`
- [ ] "← Back to Home" on legal pages returns to homepage
- [ ] Mobile: hamburger opens, layout stacks

---

## Assets embedded (nothing to upload)

Everything is baked into the code blocks as base64 data URIs, so the site is fully
self-contained. Optimized copies also live in `website/Shraga/logos/`:

- **Hero banner:** your blueprint landing image (`Gemini_Generated_Image_8cjriu…`),
  Gemini watermark removed, optimized to `hero.webp` — displayed full-bleed under the nav.
- **Nav logo:** `logo-nav.webp` (navy horizontal lockup).
- **Footer logo:** `logo-white.webp` (white lockup for the dark footer).
- **Favicon / accent mark:** transparent metallic "S" (`icon-512.png` + sizes),
  extracted from your stacked logo.

## Animations on the site

Pure CSS + a tiny inline script (no external libraries, CSP-safe for Squarespace):
metallic shimmer sweep across the hero banner, drifting blueprint grid, scroll-reveal
fade-ups with stagger, count-up stat numbers, animated section-heading underlines,
nav shadow on scroll, button sheen, card hover lifts, and floating hero mark. All of it
respects `prefers-reduced-motion`.

---

## Brand + content reference

- Tagline: **Capital that's ready to break ground**
- Model: **Direct lender** (funds its own capital, in-house underwriting)
- Primary CTA: **Apply Now / Get funded**
- Products: Construction Loans (flagship), Commercial Real Estate, Bridge, Term Loans,
  Lines of Credit, Equipment Financing, SBA-Style Loans, Working Capital
- Palette: `#0B2E6B` deep blue / `#1657C4` blue / `#2E7BE4` bright blue /
  `#7C8AA0` steel / `#F3F7FC` soft bg / `#0E1E33` ink text
- Fonts: Space Grotesk (display), Inter (body), JetBrains Mono (eyebrow labels)
