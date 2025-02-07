<script lang="ts">
	import Radio from '$lib/components/ui/input/radio.svelte'
	import type { Component } from '$lib/stores/exam/exam.svelte'
	import { cn } from '$lib/utils'

	type Props = {
		question: Component['questions'][number]
		onanswer: (question: Props['question']) => void
	}

	let { question, onanswer }: Props = $props()
	let group = $state('')

	$effect(() => {
		const answerIndex = question.item.answers.findIndex((answer) => answer.label === group)

		for (let i = 0; i < question.item.answers.length; i++) {
			if (i === answerIndex) {
				question.item.answers[i].checked = true
			} else {
				question.item.answers[i].checked = false
			}
		}

		onanswer(question)
	})
</script>

<div class="mt-2 flex flex-col gap-2">
	{#each question.item.answers as answer, i}
		<label
			class={cn(
				'rounded-lg bg-neutral-100 px-6 py-4 has-[:checked]:ring-2 has-[:checked]:ring-primary'
			)}
		>
			<input
				type="radio"
				id="question-{question.id}-{i}"
				value={answer.label}
				checked={answer.checked}
				bind:group
			/>
			<label class="font-medium" for="question-{question.id}-{i}">{answer.label}</label>
		</label>
	{/each}
</div>
