import { readItems } from '@directus/sdk'
import type { Services } from '.'
import type { PracticeExam } from './practice-exam'

export class PracticeExamsService {
	constructor(readonly services: Services) {}

	async list(): Promise<PracticeExam[]> {
		const exams = await this.services.event.locals.directus.request(
			readItems('practice_exams', {
				filter: {
					category: { _eq: this.services.state.user!.subscription.subscription.type }
				}
			})
		)

		return await Promise.all(exams.map((e) => this.getOne(e.id)))
	}

	/**
	 * Fetches a specific practice exam based on its id.
	 *
	 * @param {string} id - The id of the practice exam.
	 * @returns {Promise<PracticeExam>} A promise that resolves to the practice exam data.
	 */
	async getOne(id: string) {
		return this.services.practiceExam(id).fetch()
	}

	/**
	 * Retrieves the practice exams available for the current user based on their subscription.
	 *
	 * This function checks the user's current practice exams and compares them against their
	 * subscription limits. If the user has not yet reached their maximum allowed exams, it
	 * fetches additional exams and attaches them to the user. The function then returns an
	 * updated list of the user's practice exams.
	 *
	 * @returns {Promise<Directus.SchemaMapper<Directus.UserExams, { exam: Directus.PracticeExams }>[]>}
	 *          A promise that resolves to an array of the user's practice exams, including
	 *          any newly added exams if applicable.
	 */
	async getExamsForUser(): Promise<
		Directus.SchemaMapper<
			Directus.UserExams,
			{
				exam: PracticeExam
			}
		>[]
	> {
		const { practiceExams, subscription } = this.services.state.user!

		if (practiceExams.length > 0 && subscription.maxPracticeExams! === practiceExams.length) {
			return practiceExams
		}

		/**
		 * Check if practice exams have been set based on subscription
		 */
		if (subscription.maxPracticeExams! > 0) {
			const exams = (await this.list())
				.filter((e) => practiceExams.findLastIndex((ue) => e.id === ue.exam.id) === -1)
				.slice(0, subscription.maxPracticeExams! - practiceExams.length)

			/**
			 * Attach exams to user
			 */
			await Promise.all(exams.map(async (exam) => await this.services.user().addExam(exam)))
			return await this.services.user().getPracticeExams()
		}

		return []
	}
}
