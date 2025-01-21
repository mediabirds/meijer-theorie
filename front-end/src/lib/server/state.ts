import type { Session } from '$lib/stores/app.svelte'
import type { RequestEvent } from '@sveltejs/kit'

export class State {
	readonly url: URL

	readonly category: string | undefined

	readonly course: string | undefined

	readonly chapter: string | undefined

	readonly lesson: string | undefined

	readonly session: App.Locals['session']

	readonly user: App.Locals['user']

	readonly practiceExam: string | undefined

	constructor(event: RequestEvent) {
		this.url = event.url
		this.category = event.params.category
		this.course = event.params.course
		this.chapter = event.params.chapter
		this.lesson = event.params.lesson
		this.session = event.locals.session
		this.user = event.locals.user
	}
}
