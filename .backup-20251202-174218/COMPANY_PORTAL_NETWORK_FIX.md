# Company Portal NetworkError Fix

## Issue

NetworkError when trying to login from GitHub Pages. This is due to **mixed content blocking**:

- GitHub Pages serves content over **HTTPS**
- Backend API is currently **HTTP-only**
- Browsers block HTTPS pages from accessing HTTP APIs

## Solutions

### Option 1: Enable HTTPS on Backend (Best)

Set up SSL certificate for `backend.klasholmgren.se` so it can be accessed via HTTPS.

### Option 2: Update API URL in Company Portal

The company portal currently uses:
```javascript
const API_BASE_URL = 'http://backend.klasholmgren.se/api';
```

This will be blocked from HTTPS pages. Need to either:
- Use HTTPS URL (requires backend SSL)
- Use a proxy service
- Host portal on HTTP domain

### Option 3: CORS Proxy (Temporary)

Use a CORS proxy service to make requests from HTTPS to HTTP.

## Current Status

- ✅ CORS configured to allow all origins (`*`)
- ✅ Server.js loads CORS from config
- ⚠️ Mixed content issue (HTTPS → HTTP blocked by browser)

## Next Steps

1. Enable HTTPS on backend domain OR
2. Use HTTP for company portal OR
3. Implement CORS proxy

