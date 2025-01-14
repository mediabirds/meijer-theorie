import { readItems } from '@directus/sdk'
import { json } from '@sveltejs/kit'

export const GET = async ({ locals }) => {
	const subscriptions = await locals.directus.request(
		readItems('subscription_tiers', {
			fields: ['*']
		})
	)

	return json(subscriptions)
}
