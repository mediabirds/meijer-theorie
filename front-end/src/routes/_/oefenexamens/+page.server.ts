export const load = async ({ locals }) => {
	const exams = await locals.services.practiceExams().list()

	return {
		exams
	}
}
