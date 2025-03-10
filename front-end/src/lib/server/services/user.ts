import type { Services } from '.'
import type { PracticeExam } from './practice-exam'
import { readUser, updateUser, type DirectusUser, type Query } from '@directus/sdk'
import { sortBy } from 'lodash-es'
import { differenceInMilliseconds } from 'date-fns'

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
		const exams = (await this.fetch()).practiceExams
		return sortBy(exams, 'exam.order')
	}

	async addExam(exam: PracticeExam) {
		const exams = this.services.state.user?.practiceExams || []
		const response = await this.update({
			// @ts-ignore
			practiceExams: exams.concat({ exam: exam.id })
		})

		return response.practiceExams
	}

	pauseSubscription() {
		if (this.services.state.user?.isPausedAt) {
			return null
		}

		return this.update({ isPaused: true, isPausedAt: new Date().toISOString() })
	}

	resumeSubscription() {
		const difference = differenceInMilliseconds(
			this.services.state.user?.expiresAt!,
			new Date(this.services.state.user?.isPausedAt!)
		)
		const newExpiresAt = new Date(new Date().getTime() + difference)

		return this.update({
			isPaused: false,
			expiresAt: newExpiresAt.toISOString()
		})
	}
}
