# Mooves Website

This directory contains the deployed Mooves web application.

## Structure

- **Flutter Web App**: The main Flutter web application (automatically copied from `mooves-frontend/build/web/`)
- **Additional Pages**: 
  - `company-portal.html` - Company portal
  - `policy.html` - Policy page
  - `privacy-policy.html` - Privacy policy
  - `terms.html` - Terms of service
  - `reset-password.html` - Password reset page
  - `child-safety-standards.html` - Child safety information

## Deployment

The Flutter web app is automatically copied here by:
1. **GitHub Actions workflow** - Runs on push to main/master
2. **Local script** - `mooves-frontend/scripts/copy-web-to-website.sh`

## Manual Copy

To manually copy the Flutter web build:

```bash
cd mooves-frontend
flutter build web --release --base-href /
./scripts/copy-web-to-website.sh
```

## GitHub Pages

This directory is deployed to GitHub Pages via the `gh-pages` branch.

- **Settings**: Repository → Settings → Pages
- **Source**: Deploy from a branch → `gh-pages` → `/ (root)`
- **URL**: Your GitHub Pages URL (e.g., `https://username.github.io/mooves/`)

## Important Files Preserved

The following files are preserved when copying the Flutter build:
- `company-portal.html`
- `policy.html`
- `privacy-policy.html`
- `terms.html`
- `reset-password.html`
- `child-safety-standards.html`
- `mooves-icon.png`
- `deploy-to-server.sh`
- All `.md` files

