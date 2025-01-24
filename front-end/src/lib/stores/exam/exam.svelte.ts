import { goto } from '$app/navigation'
import { page } from '$app/state'
import type { PracticeExam } from '$lib/server/services/practice-exam'
import { session } from '../app.svelte'
import { createTimer } from '../timer.svelte'

export type Component = Directus.SchemaMapper<
	Directus.PracticeExamsComponents,
	{
		questions: Directus.SchemaMapper<
			Directus.PracticeExamsComponentsQuestions,
			{
				item: {
					thumbnail: string
					title: string
					answers: { label: string; isCorrectAnswer: boolean }[]
				}
			}
		>[]
	}
>

export class Exam {
	// /**
	//  * The current practice exam
	//  *
	//  * @type {Directus.SchemaMapper<Directus.PracticeExams, { exam: Directus.PracticeExams }>}
	//  */
	// current = $derived(session.user?.practiceExams.find(({ exam }) => exam.id === page.params.id))

	// /**
	//  * Whether the exam is started
	//  *
	//  * @type {boolean}
	//  */
	// isStarted = $state(false)

	// /**
	//  * The time limit in minutes for current component
	//  *
	//  * @type {number}
	//  */
	// timeLimitMinutes = $derived.by(() => {
	// 	return this.component?.timeLimitInMinutes || 0
	// })

	// /**
	//  * The time limit per question in seconds
	//  *
	//  * @type {number}
	//  */
	// timeLimitPerQuestionSeconds = $derived.by(() => {
	// 	return this.component?.timeLimitPerQuestionSeconds || 0
	// })

	// /**
	//  * The current component
	//  *
	//  * @type {Component | null}
	//  */
	// component: Component | null = $state(null)
	// /**
	//  * The current question
	//  *
	//  * @type {Component['questions'][number] | null}
	//  */
	// question: Component['questions'][number] | null = $state.raw(null)

	// timer = $state<{
	// 	exam: ReturnType<typeof createTimer> | null
	// 	question: ReturnType<typeof createTimer> | null
	// }>({
	// 	exam: null,
	// 	question: null
	// })

	// /**
	//  * Sets up the exam component and question when the store is initialized.
	//  *
	//  * If the current practice exam is set, the first component of the exam is set as the current component,
	//  * and the first question of the current component is set as the current question.
	//  *
	//  * This is done with two nested `$effect`s, so that the current component and question are updated
	//  * whenever the current practice exam changes.
	//  */
	// constructor() {
	// 	$effect.root(() => {
	// 		$effect(() => {
	// 			if (!this.component && this.current?.exam) {
	// 				this.component = {
	// 					...this.current.exam.components[0],
	// 					isStarted: false
	// 				}
	// 				this.question = this.component!.questions[0]
	// 			}
	// 		})

	// 		$effect(() => {
	// 			if (this.component && this.component.isStarted && !this.timer.exam) {
	// 				this.timer.exam = createTimer(this.timeLimitMinutes * 60)
	// 			}
	// 		})
	// 	})
	// }

	// /**
	//  * Returns the next question if there is one
	//  *
	//  * @returns {Component['questions'][number] | null} The next question, or null if there is no next question
	//  */
	// nextQuestion() {
	// 	if (!this.component) {
	// 		return null
	// 	}

	// 	if (!this.question) {
	// 		return (this.question = this.component.questions[0])
	// 	}

	// 	const questionIndex = this.component.questions.findIndex(({ id }) => id === this.question?.id)

	// 	if (questionIndex === this.component.questions.length - 1) {
	// 		return null
	// 	}

	// 	return (this.question = this.component.questions[questionIndex + 1])
	// }

	// /**
	//  * Returns the previous question if there is one.
	//  *
	//  * @returns {Component['questions'][number] | null} The previous question, or null if there is no previous question.
	//  */
	// prevQuestion() {
	// 	if (!this.component) {
	// 		return null
	// 	}

	// 	const questionIndex = this.component.questions.findIndex(({ id }) => id === this.question?.id)

	// 	if (questionIndex === 0) {
	// 		return null
	// 	}

	// 	return (this.question = this.component?.questions[questionIndex - 1])
	// }
	id?: string = $state.raw(undefined)

	title?: string = $state.raw(undefined)

	description?: string = $state.raw(undefined)

	components?: Component[] = $state.raw(undefined)

	currentComponent?: Component & { started: boolean } = $state(undefined)

	currentQuestion?: Component['questions'][number] = $state(undefined)

	currentQuestionIndex = $derived.by(() => {
		if (!this.currentComponent) {
			return 0
		}

		if (!this.currentQuestion) {
			return 0
		}

		return this.currentComponent.questions.findIndex(({ id }) => id === this.currentQuestion?.id)
	})

	componentTimer = $derived.by(() => {
		if (!this.currentComponent || this.currentComponent.started === false) {
			return null
		}

		this.currentComponent.timeLimitInMinutes = this.currentComponent.timeLimitInMinutes || 0

		if (this.currentComponent.timeLimitInMinutes > 0) {
			return createTimer(this.currentComponent.timeLimitInMinutes * 60)
		}
	})

	hasNextQuestion() {
		if (!this.currentComponent) {
			return false
		}

		if (!this.currentQuestion) {
			return false
		}

		if (this.currentQuestionIndex < this.currentComponent.questions.length - 1) {
			return true
		}

		return false
	}

	hasPrevQuestion() {
		if (!this.currentComponent) {
			return false
		}

		if (!this.currentQuestion) {
			return false
		}

		if (this.currentQuestionIndex > 0) {
			return true
		}

		return false
	}

	init(exam: PracticeExam) {
		this.id = exam.id
		this.title = exam.title
		this.description = exam.description!
		this.components = exam.components
		this.currentComponent = { ...this.components[0], started: false }
		this.currentQuestion = this.currentComponent.questions[0]
	}

	nextQuestion() {
		if (!this.hasNextQuestion()) {
			return null
		}

		const questionIndex = this.currentComponent!.questions.findIndex(
			(e) => e.id === this.currentQuestion!.id
		)

		console.log(questionIndex, this.currentComponent!.questions.length)

		this.currentQuestion = this.currentComponent!.questions[questionIndex + 1]
	}

	prevQuestion() {
		if (!this.hasPrevQuestion()) {
			return null
		}

		const questionIndex = this.currentComponent!.questions.findIndex(
			(e) => e.id === this.currentQuestion!.id
		)

		this.currentQuestion = this.currentComponent!.questions[questionIndex - 1]
	}
}
