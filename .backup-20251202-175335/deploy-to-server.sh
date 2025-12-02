#!/bin/bash
# Deploy Mooves policy website to server

echo "🚀 Deploying Mooves policy website..."
echo ""

SERVER="ubuntu@158.174.210.28"
KEY="../mooves-backend/PrivateKeyBahnhof.rsa"
WEB_DIR="/var/www/mooves-policy"

# Create web directory on server if it doesn't exist
echo "📁 Creating web directory on server..."
ssh -i "$KEY" "$SERVER" "sudo mkdir -p $WEB_DIR && sudo chown ubuntu:ubuntu $WEB_DIR"

# Copy all website files
echo "📤 Copying website files..."
scp -i "$KEY" *.html "$SERVER:$WEB_DIR/"
scp -i "$KEY" *.jpg "$SERVER:$WEB_DIR/" 2>/dev/null || true
scp -i "$KEY" *.png "$SERVER:$WEB_DIR/" 2>/dev/null || true
scp -i "$KEY" *.pdf "$SERVER:$WEB_DIR/" 2>/dev/null || true
scp -i "$KEY" *.apk "$SERVER:$WEB_DIR/" 2>/dev/null || true

echo ""
echo "✅ Files deployed to server!"
echo ""
echo "📋 Next steps:"
echo "1. Configure nginx to serve from $WEB_DIR"
echo "2. Set up SSL certificate for mooves.klasholmgren.se"
echo ""
echo "Example nginx config:"
echo "---"
echo "server {"
echo "    listen 80;"
echo "    server_name mooves.klasholmgren.se;"
echo "    root $WEB_DIR;"
echo "    index index.html;"
echo "}"
echo "---"

