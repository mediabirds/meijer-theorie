import { readItem } from '@directus/sdk'
import type { Services } from '.'

export type PracticeExam = Directus.SchemaMapper<
	Directus.PracticeExams,
	{
		components: Directus.SchemaMapper<
			Directus.PracticeExamsComponents,
			{
				questions: Directus.SchemaMapper<
					Directus.PracticeExamsComponentsQuestions,
					| {
							collection: 'questions_in_order'
							item: {
								id: number
								thumbnail: string
								title: string
								answers: { label: string; order: number }[]
							}
					  }
					| {
							collection: 'questions_multiple_choice'
							item: {
								id: number
								thumbnail: string
								title: string
								answers: { label: string; isCorrectAnswer: boolean }[]
							}
					  }
				>[]
			}
		>[]
	}
>

export class PracticeExamService {
	constructor(
		readonly services: Services,
		readonly id: string
	) {}

	async fetch() {
		return await this.services.event.locals.directus.request<PracticeExam>(
			readItem('practice_exams', this.id, {
				fields: ['*', { components: ['*', { questions: ['*', { item: ['*'] }] }] }]
			})
		)
	}
}
