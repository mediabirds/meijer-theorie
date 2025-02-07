import type { Component } from './exam.svelte'

export class Result {
	components = $state<Component[]>([])

	totalQuestionsCount = $derived(
		this.components.flatMap((component) => component.questions).length ?? 0
	)

	correctAnswersCount = $derived(
		this.components
			.flatMap((component) => component.questions)
			.filter((question) => question.isCorrect).length ?? 0
	)

	minCorrectAnswersCount = $derived(
		this.components.reduce(
			(acc, component) => acc + (component.minAmountOfCorrectAnswers ?? 0),
			0
		) ?? 0
	)

	didPass = $derived(this.correctAnswersCount >= this.minCorrectAnswersCount)

	showResult = $state(false)

	constructor(id: string) {
		const item = localStorage.getItem(id)

		if (!item) {
			throw Error(`${id} does not exist.`)
		}

		this.components = JSON.parse(item)
		this.components.forEach((component) => {
			component.questions.forEach((question) => {
				if (question.collection === 'questions_in_order') {
					question.isCorrect = question.item.answers.every(
						(answer) => answer.givenOrder === answer.order
					)
				}

				if (question.collection === 'questions_multiple_choice') {
					question.isCorrect = question.item.answers.every(
						(answer) => answer.checked === answer.isCorrectAnswer
					)
				}
			})
		})
	}
}
