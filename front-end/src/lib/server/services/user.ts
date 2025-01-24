import { readUser, updateUser, type DirectusUser, type Query } from '@directus/sdk'
import type { Services } from '.'
import type { PracticeExam } from './practice-exam'

const fields: Query<Directus.CustomDirectusTypes, Directus.DirectusUsers>['fields'] = [
	'*',
	{
		subscription: ['*', { subscription: ['type'] }],
		practiceExams: [
			'*',
			{
				exam: [
					'*',
					{
						components: [
							'*',
							{
								questions: ['collection', { item: ['*'] }]
							}
						]
					}
				]
			}
		],
		videoCourses: ['*', { videoCourse: ['*'] }]
	}
]

export class UserService {
	constructor(
		readonly services: Services,
		readonly id: string
	) {}

	async fetch(): Promise<Exclude<App.Locals['user'], null>> {
		return this.services.event.locals.directus.request<Exclude<App.Locals['user'], null>>(
			// @ts-ignore
			readUser(this.id, { fields })
		)
	}

	async update(
		data: Partial<DirectusUser<Directus.CustomDirectusTypes>>
	): Promise<Exclude<App.Locals['user'], null>> {
		return this.services.event.locals.directus.request<Exclude<App.Locals['user'], null>>(
			// @ts-ignore
			updateUser(this.id, data, { fields })
		)
	}

	async getPracticeExams() {
		return (await this.fetch()).practiceExams
	}

	async addExam(exam: PracticeExam) {
		const exams = this.services.state.user?.practiceExams || []
		const response = await this.update({
			// @ts-ignore
			practiceExams: exams.concat({ exam: exam.id })
		})

		return response.practiceExams
	}
}
