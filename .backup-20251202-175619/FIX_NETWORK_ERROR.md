# Fix NetworkError in Company Portal

## The Problem

The company portal is getting a NetworkError when trying to login. This is likely due to:

1. **Mixed Content**: GitHub Pages serves content over HTTPS, but the backend API is HTTP-only
2. **CORS Issues**: GitHub Pages origin may not be in allowed origins

## Solution

The backend API is currently HTTP-only (`http://backend.klasholmgren.se`), but GitHub Pages is HTTPS. Browsers block mixed content (HTTPS page accessing HTTP API).

### Option 1: Use HTTPS for Backend (Recommended)

Set up SSL certificate for `backend.klasholmgren.se` and update the company portal to use HTTPS.

### Option 2: Use CORS Proxy (Quick Fix)

Use a CORS proxy service or configure the API URL to work around mixed content.

### Option 3: Host Portal on HTTP Domain

Host the company portal on an HTTP domain that matches the backend.

## Current Status

- ✅ Backend CORS updated to allow all origins (`*`)
- ✅ Server.js updated to load CORS from config
- ⚠️ Mixed content issue remains (HTTPS → HTTP)

## Next Steps

1. **Enable HTTPS on backend** OR
2. **Use HTTP for company portal** OR  
3. **Add CORS proxy**

