import { json } from '@sveltejs/kit'

export const POST = async ({ locals }) => {
	const response = await locals.services.user().pauseSubscription()

	if (response === null) {
		return json({ code: 'CAN_ONLY_PAUSE_ONCE' }, { status: 400 })
	}

	return json(response)
}
