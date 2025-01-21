import { readItems } from '@directus/sdk'
import type { Services } from '.'
import type { PracticeExam } from './practice-exam'

export class PracticeExamsService {
	constructor(readonly services: Services) {}

	async list() {
		console.log(this.services.state)
		const exams = await this.services.event.locals.directus.request<PracticeExam[]>(
			readItems('practice_exams', {
				filter: {
					category: { _eq: this.services.state.user!.subscription.subscription.type }
				},
				fields: [
					'*',
					{
						components: ['*', { questions: ['collection', { item: ['*'] }] }]
					}
				]
			})
		)

		return exams
	}

	async getOne(id: string) {}
}
