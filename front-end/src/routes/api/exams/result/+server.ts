import { parseResult } from '$lib/utils'
import { json } from '@sveltejs/kit'

export const POST = async ({ locals, request }) => {
	const body = await request.json()
	const result = parseResult(body.components)

	const response = await locals.services.userExam(body.id).update({
		result: parseResult(body.components),
		didPass: result.didPass
	})

	return json(response)
}
