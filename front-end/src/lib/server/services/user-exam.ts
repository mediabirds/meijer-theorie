import { readItem, updateItem } from '@directus/sdk'
import type { Services } from '.'
import type { PracticeExam } from '$lib/stores/exam/exam.svelte'

export class UserExamService {
	constructor(
		readonly services: Services,
		readonly id: string
	) {}

	async fetch() {
		return await this.services.event.locals.directus.request<PracticeExam>(
			readItem('user_exams', this.id, {
				fields: ['*', { exam: ['*', { components: ['*', { questions: ['*', { item: ['*'] }] }] }] }]
			})
		)
	}

	update(data: Partial<Directus.UserExams>) {
		return this.services.event.locals.directus.request(updateItem('user_exams', this.id, data))
	}
}
