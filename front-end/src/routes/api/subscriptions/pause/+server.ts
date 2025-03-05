import { json } from '@sveltejs/kit'

export const POST = async ({ locals }) => {
	const response = await locals.services.user().pauseSubscription()

	return json(response)
}
