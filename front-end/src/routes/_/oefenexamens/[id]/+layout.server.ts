import { error } from '@sveltejs/kit'

export const load = async ({ locals, params }) => {
	const practiceExam = locals.user!.practiceExams.find((e) => e.exam.id === params.id)

	if (!practiceExam) {
		error(404, 'PRACTICE_EXAM_NOT_FOUND')
	}

	return {
		practiceExam
	}
}
