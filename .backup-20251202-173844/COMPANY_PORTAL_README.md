# Company Portal - Coupon Registration System

## Overview

A web-based portal for companies to register their business and create coupons/challenges for Mooves users. Companies can create fitness challenges with coupon rewards that users can earn by completing activities.

## Features

### For Companies

1. **Registration & Login**
   - Companies can register with email/password
   - Automatic store account creation during registration
   - Secure authentication with JWT tokens

2. **Store Management**
   - View store information
   - Update store details (name, description, location)
   - Manage store status

3. **Coupon/Challenge Creation**
   - Create fitness challenges with:
     - Target distance (meters)
     - Target duration (minutes)
     - Start and end dates
     - Maximum participants
   - Define coupon rewards:
     - Coupon code
     - Discount percentage or fixed amount
     - Coupon description
     - Expiration date

4. **Dashboard**
   - View all created challenges
   - See challenge status (active/inactive)
   - Monitor coupon details

## Files Created

### Backend

1. **`mooves-backend/nodejs-backend/controllers/storeController.js`**
   - `createStore()` - Create store account
   - `getMyStore()` - Get current user's store
   - `updateMyStore()` - Update store details

2. **`mooves-backend/nodejs-backend/routes/stores.js`**
   - `POST /api/stores` - Create store
   - `GET /api/stores/my-store` - Get my store
   - `PUT /api/stores/my-store` - Update my store

3. **Updated `mooves-backend/nodejs-backend/server.js`**
   - Added store routes registration

### Frontend

1. **`mooves-website/company-portal.html`**
   - Complete web interface for companies
   - Registration/login forms
   - Dashboard with store info
   - Challenge/coupon creation form
   - Challenge listing

2. **Updated `mooves-website/index.html`**
   - Added "For Companies" link to navigation

## API Endpoints

### Store Management

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/stores` | Create store account | Yes |
| GET | `/api/stores/my-store` | Get my store info | Yes |
| PUT | `/api/stores/my-store` | Update my store | Yes |

### Challenge/Coupon Creation

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/store-goals` | Create challenge with coupon | Yes |
| GET | `/api/store-goals/store/my-goals` | Get my challenges | Yes |
| GET | `/api/store-goals/active` | Get all active challenges | No |

## Usage

### Accessing the Portal

1. Navigate to: `https://mooves.klasholmgren.se/company-portal.html`
2. Or click "For Companies" in the main website navigation

### Company Registration Flow

1. **Register**
   - Fill in company name, email, password
   - Add company description and location (optional)
   - Submit registration
   - System automatically:
     - Creates user account
     - Logs in the user
     - Creates store account

2. **Login**
   - Use registered email and password
   - Access dashboard after login

3. **Create Challenge/Coupon**
   - Fill in challenge details (title, distance/duration, dates)
   - Define coupon details (code, discount, description)
   - Submit to create challenge
   - Users can now join this challenge in the app

### How It Works

1. **Company creates challenge** → Challenge appears in Mooves app
2. **Users join challenge** → Users track their activities
3. **User completes challenge** → Coupon is automatically awarded
4. **User redeems coupon** → Uses coupon code at the company/store

## Database Schema

### Stores Table
- `id` - Store ID (primary key)
- `userId` - Reference to User account
- `storeName` - Company/store name
- `description` - Store description
- `location` - Store location/address
- `logo` - Store logo URL
- `isActive` - Store status
- `createdAt`, `updatedAt` - Timestamps

### StoreGoals Table (Challenges)
- `id` - Goal ID (UUID)
- `storeId` - Reference to Store
- `title` - Challenge title
- `description` - Challenge description
- `targetDistanceMeters` - Distance target
- `targetDurationMinutes` - Duration target
- `startDate`, `endDate` - Challenge period
- `maxParticipants` - Participant limit
- `couponCode` - Coupon code to award
- `couponDescription` - Coupon description
- `couponDiscount` - Discount percentage
- `couponDiscountAmount` - Fixed discount amount
- `isActive` - Challenge status

### Coupons Table (User Awards)
- `id` - Coupon ID (UUID)
- `userId` - User who earned the coupon
- `storeId` - Store that issued the coupon
- `goalId` - Challenge that awarded the coupon
- `code` - Coupon code
- `description` - Coupon description
- `discount` - Discount percentage
- `discountAmount` - Fixed discount amount
- `isUsed` - Whether coupon was used
- `expiresAt` - Coupon expiration
- `qrCode` - QR code data

## Security

- All endpoints require authentication (JWT tokens)
- Store accounts are linked to user accounts
- Only store owners can create challenges for their store
- Validation on all input fields

## Next Steps

1. **Deploy backend changes** to production server
2. **Upload company-portal.html** to website server
3. **Test the complete flow**:
   - Register a company
   - Create a challenge
   - Verify it appears in the app
   - Complete challenge as user
   - Verify coupon is awarded

## Testing

To test locally:

1. Start backend: `cd mooves-backend/nodejs-backend && npm start`
2. Open `mooves-website/company-portal.html` in browser
3. Update `API_BASE_URL` in the HTML if needed
4. Register a company and create a challenge
5. Check database to verify data was created

## Troubleshooting

### "Failed to create store account"
- Check if user already has a store
- Verify user is authenticated
- Check database connection

### "You must have an active store account to create goals"
- User needs to create/store account first
- Check store status is active

### Challenge not appearing in app
- Verify challenge `isActive` is true
- Check start date is not in the future
- Verify API endpoint `/api/store-goals/active` returns the challenge

