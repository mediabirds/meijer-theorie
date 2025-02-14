import { createTimer, createTimer2 } from '../timer.svelte'

export type Component = Directus.SchemaMapper<
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
						answers: { label: string; order: number; givenOrder?: number }[]
					}
					isActive?: boolean
					isCorrect?: boolean
			  }
			| {
					collection: 'questions_multiple_choice'
					item: {
						id: number
						thumbnail: string
						title: string
						answers: { label: string; isCorrectAnswer: boolean; checked?: boolean }[]
					}
					isActive?: boolean
					isCorrect?: boolean
			  }
		>[]
		started?: boolean
		isActive?: boolean
	}
>

export type PracticeExam = Directus.SchemaMapper<
	Directus.UserExams,
	{
		exam: Directus.SchemaMapper<
			Directus.PracticeExams,
			{
				components: Component[]
			}
		>
		result: {
			components: any
			totalQuestionsCount: number
			correctAnswersCount: number
			minCorrectAnswersCount: number
			didPass: boolean
		}
	}
>

export class Exam {
	id?: number = $state.raw(undefined)

	title?: string = $state.raw(undefined)

	description?: string = $state.raw(undefined)

	started = $state(false)

	components: Component[] = $state([])

	currentComponent = $derived(this.components.find(({ isActive }) => isActive))

	currentComponentIndex = $derived(this.components.findIndex(({ isActive }) => isActive) || 0)

	currentQuestion = $derived(this.currentComponent?.questions.find(({ isActive }) => isActive))

	currentQuestionIndex = $derived(
		this.currentComponent?.questions.findIndex(({ isActive }) => isActive) || 0
	)

	componentTimer = $derived.by(() => {
		if (
			!this.currentComponent ||
			this.currentComponent.started === false ||
			this.started === false
		) {
			return
		}

		this.currentComponent.timeLimitInMinutes = this.currentComponent.timeLimitInMinutes || 0

		if (this.currentComponent.timeLimitInMinutes > 0) {
			return createTimer(this.currentComponent.timeLimitInMinutes * 60)
		}
	})

	questionTimer = $derived.by(() => {
		if (!this.currentQuestion) {
			return
		}

		if (
			!this.currentComponent ||
			this.currentComponent.started === false ||
			this.started === false
		) {
			return
		}

		this.currentComponent.timeLimitPerQuestionSeconds =
			this.currentComponent.timeLimitPerQuestionSeconds || 0

		if (this.currentComponent.timeLimitPerQuestionSeconds > 0) {
			return createTimer2(this.currentComponent.timeLimitPerQuestionSeconds * 1000)
		}
	})

	hasNextQuestion = $derived.by(() => {
		if (!this.currentComponent) {
			return false
		}

		return this.currentQuestionIndex < this.currentComponent.questions.length - 1
	})

	hasPrevQuestion = $derived.by(() => {
		if (!this.currentComponent) {
			return false
		}

		return this.currentQuestionIndex > 0
	})

	hasNextComponent = $derived.by(() => {
		if (!this.currentComponent) {
			return false
		}

		return this.currentComponentIndex < this.components.length - 1
	})

	hasPrevComponent = $derived.by(() => {
		if (!this.currentComponent) {
			return false
		}

		return this.currentComponentIndex > 0
	})

	didReachEnd = $derived.by(() => {
		if (!this.currentComponent) {
			return false
		}

		return (
			this.currentComponentIndex === this.components.length - 1 &&
			this.currentQuestionIndex === this.currentComponent.questions.length - 1
		)
	})

	init(practiceExam: PracticeExam) {
		this.id = practiceExam.id
		this.title = practiceExam.exam.title
		this.description = practiceExam.exam.description!
		this.components = practiceExam.exam.components
		this.started = false

		this.components.forEach((component, index) => {
			component.started = false
			component.isActive = index === 0

			// TODO: Remove this
			// if (index === 0) {
			// 	component.started = true
			// }

			component.questions.forEach((question, index) => {
				question.isActive = index === 0

				// @TODO: Remove this, this is just for testing
				// if (question.collection === 'questions_in_order') {
				// 	question.item.answers.forEach((answer, ai) => {
				// 		answer.givenOrder = answer.order === 0 ? 2 : answer.order === 2 ? 0 : answer.order
				// 	})
				// }

				// // @TODO: Remove this, this is just for testing
				// if (question.collection === 'questions_multiple_choice') {
				// 	question.item.answers.forEach((answer, index) => {
				// 		if (index === 0) {
				// 			answer.checked = true
				// 		} else {
				// 			answer.checked = false
				// 		}
				// 	})
				// }
			})
		})
	}

	nextQuestion() {
		if (!this.hasNextQuestion) {
			if (this.hasNextComponent) {
				const index = this.currentComponentIndex

				this.components[index].isActive = false
				this.components[index].started = false
				this.components[index + 1].isActive = true
			}

			return
		}

		const index = this.currentQuestionIndex

		this.currentComponent!.questions[index].isActive = false
		this.currentComponent!.questions[index + 1].isActive = true
	}

	prevQuestion() {
		if (!this.hasPrevQuestion) {
			if (this.hasPrevComponent) {
				const index = this.currentComponentIndex

				this.components[index].isActive = false
				this.components[index].started = false
				this.components[index - 1].isActive = true
			}
		}
		const questionIndex = this.currentQuestionIndex

		this.currentComponent!.questions[questionIndex].isActive = false
		this.currentComponent!.questions[questionIndex - 1].isActive = true
	}
}
