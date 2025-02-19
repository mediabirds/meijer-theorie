# API Documentation

This project exposes the following API routes:

```txt
GET /api/subscriptions
POST /api/users/create
```

## GET /api/subscriptions

Retrieve all available subscription plans offered by the platform by sending a GET request to /api/subscriptions.

#### Response Type

```ts
type SubscriptionResponse = {
	id: number
	type: string
	tiers: {
		id: string
		icon: string
		title: string
		slug: string
		featureList: {
			description: string
		}[]
		price: number
		discountPrice: number | null
		daysOfAccess: number
		maxPracticeExams: number
		subscription: number
	}[]
}[]
```

#### Example request

```ts
const request = await fetch(`${API_URL}/api/subscriptions`)
const response = (await request.json()) as SubscriptionResponse
```

## POST /api/users/create

Create a new user account by sending a `POST` request to `/api/users/create` with the required user details in the request body.

Once the user is successfully created, an automated email notification will be sent to inform them about their new account.

#### Request body

```json
{
	"email": "richard@codeit.ninja",
	"firstName": "Richard",
	"lastName": "Mauritz",
	"subscriptionTier": "8e173084-fb18-45db-8d7a-bc78819b26ca"
}
```

#### Response

```ts
type UsersCreateResponse = {
	status: string
	data: {
		email: string
		first_name: string
		last_name: string
		password: string
		role: string
		subscription: string
		expiresAt: string // ISO 8601 date string
	}
}
```

#### Example request

```ts
const request = await fetch(`${API_URL}/api/users/create`, {
	method: 'POST',
	headers: { 'Content-Type': 'application/json' },
	body: JSON.stringify({
		email: 'richard@codeit.ninja',
		firstName: 'Richard',
		lastName: 'Mauritz',
		subscriptionTier: '8e173084-fb18-45db-8d7a-bc78819b26ca'
	})
})

const response = (await request.json()) as UsersCreateResponse
```

#### Notes

- You can retrieve a list of available subscriptions and tiers by sending a `GET` request to `/api/subscriptions`.
- Ensure that the **subscriptionTier** ID provided in the request exists in the available subscription list.
