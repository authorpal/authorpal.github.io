# AuthorPal Shop

Official payment website for AuthorPal Desktop License.

## Setup

1. **GitHub Pages**: Already configured on this repo
2. **Visit**: https://authorpal.github.io/author-pal-app

## Payment Flow

```
Customer → index.html (Buy Now)
         → ABA PayWay (Payment)
         → success.html (Confirmation)
         → Google Apps Script (Generate License)
         → Gmail (Email License Key)
         → Desktop App (Activate)
```

## Configuration Needed

### In `index.html`:
- Replace `YOUR_ABA_MERCHANT_ID` with your ABA PayWay merchant ID

### In `success.html`:
- Already points to your Google Apps Script
- Already links to your GitHub releases page

### In `activation_service.js` (Google Apps Script):
- Verify ABA payment token
- Generate and email license keys

## Files

- `index.html` - Buy Now page
- `success.html` - License confirmation page  
- `README.md` - This file

## Testing

1. Test locally: `python -m http.server 8000`
2. Visit: `http://localhost:8000`
3. GitHub Pages: `https://authorpal.github.io/author-pal-app`
