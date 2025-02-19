export const load = async ({ locals }) => {
	const exams = await locals.services.user().getPracticeExams()

	return {
		exams
	}
}
