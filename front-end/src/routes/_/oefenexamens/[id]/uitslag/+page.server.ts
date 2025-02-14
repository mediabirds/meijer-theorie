import { error } from '@sveltejs/kit'

export const load = async ({ locals, params }) => {
	const practiceExam = await locals.services.userExam(params.id).fetch()

	if (!practiceExam) {
		error(404, 'PRACTICE_EXAM_NOT_FOUND')
	}

	return {
		practiceExam
	}
}
