import { Exam } from './exam/exam.svelte'
import { innerWidth } from 'svelte/reactivity/window'

export type SiteState = {
	isMenuCollapsedEnabled: boolean
	isMenuCollapsed: boolean
	isMenuHidden: boolean
	description: string
	favicon: string
	logo: string
	social_links: unknown
	tagline: string
	title: string
	url: string
}

export let site: Site

export let session: Session

export let exam: Exam

export class Site implements SiteState {
	isMenuCollapsedEnabled = $state.raw(false)
	isMenuCollapsed = $state.raw(false)
	isMenuHidden = $state.raw(false)
	description: string = $state.raw('')
	favicon: string = $state.raw('')
	logo: string = $state.raw('')
	social_links: Array<{ service: string; url: string }> = $state.raw([])
	tagline: string = $state.raw('')
	title: string = $state.raw('')
	url: string = $state.raw('')
	contactMail: string = $state.raw('')
	kvk: string = $state.raw('')
	mobileMenuOpen = $state.raw(false)
	isExpired: boolean = $state.raw(false)

	isLoading = $derived.by(() => {
		if (innerWidth.current === undefined || (session.user && !session.user.email)) {
			return true
		}
	})

	set(data: ExcludeFunctionPropertyNames<SiteState>) {
		for (const [key, value] of Object.entries(data)) {
			if (key in this) {
				;(this as any)[key] = value
			}
		}
	}
}

export class Session {
	access_token?: string | null = $state.raw(null)
	refresh_token?: string | null = $state.raw(null)
	expires?: number | null = $state.raw(null)
	expires_at?: number | null = $state.raw(null)
	user?: App.Locals['user'] = $state.raw(null)

	set(data: ExcludeFunctionPropertyNames<Session>) {
		for (const [key, value] of Object.entries(data)) {
			if (key in this) {
				;(this as any)[key] = value
			}
		}
	}
}

// export class Exam {
// 	current = $derived(session.user?.practiceExams.find(({ exam }) => exam.id === page.params.id))
// 	isStarted: boolean = $state.raw(false)
// 	component: Directus.SchemaMapper<
// 		Directus.PracticeExamsComponents,
// 		{
// 			questions: Directus.SchemaMapper<
// 				Directus.PracticeExamsComponentsQuestions,
// 				{
// 					item: {
// 						thumbnail: string
// 						title: string
// 						answers: { label: string; isCorrectAnswer: boolean }[]
// 					}
// 				}
// 			>[]
// 		}
// 	> | null = $state.raw(null)
// 	timeLimitInMinutes: number = $derived(this.current?.exam.limitInMinutes || 0)
// 	timeLimitPerQuestionInSeconds: number | null = $state.raw(null)

// 	start() {
// 		if (!this.current) {
// 			throw new Error('Exam not found')
// 		}

// 		this.isStarted = true
// 		this.component = this.current.exam.components[0]
// 	}
// }

type ExcludeFunctionPropertyNames<T> = Pick<
	T,
	{
		[K in keyof T]: T[K] extends Function ? never : K
	}[keyof T]
>

site = new Site()
session = new Session()
exam = new Exam()
