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
- `favicon.ico` / `favicon.png` / `apple-touch-icon.png`
- `deploy-to-server.sh`
- All `.md` files

## Favicon

Tab icons use the official Mooves app logo (dancing cow), sourced from
`mooves-app` iOS `AppIcon` 1024×1024:

- `favicon.ico` — 16 / 32 / 48
- `favicon.png` — 64×64
- `apple-touch-icon.png` — 180×180
- `mooves-icon.png` — 512×512 (also used in-page)

GitHub Pages deploys from `master` automatically. The custom domain
`mooves.klasholmgren.se` currently frames GitHub Pages via Loopia URL
forwarding; the **browser tab favicon for that hostname** is served by
Loopia’s frameset host (`/favicon.ico`), not GitHub Pages. After this
repo change, either upload `favicon.ico` into the Loopia forward site,
switch Loopia to a HTTP redirect / GitHub Pages custom domain (CNAME),
or deploy these files with `deploy-to-server.sh` and point DNS at that
server.

