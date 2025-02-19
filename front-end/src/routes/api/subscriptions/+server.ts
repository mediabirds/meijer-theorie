import { json } from '@sveltejs/kit'

export const GET = async ({ locals }) => {
	const subscriptions = await locals.services.subscriptions().list()

	return json(subscriptions)
}
