<script lang="ts">
	import { exam } from '$lib/stores/app.svelte'
	import { getExamContext } from '..'
</script>

{#if exam.currentQuestion?.collection === 'questions_multiple_choice'}
	<div class="flex flex-col gap-2">
		{#each exam.currentQuestion!.item.answers as answer, index}
			<label class="rounded-lg bg-neutral-100 px-5 py-4">
				<input
					type="radio"
					value={answer.label}
					name="question-{exam.currentQuestion!.id}"
					id="question-{exam.currentQuestion!.id}-{index}"
					onchange={() => {
						// @ts-ignore
						exam.currentQuestion!.item.answers.forEach(
							(a: { label: string; checked?: boolean }) => {
								a.checked = false

								if (a.label === answer.label) {
									a.checked = true
								}
							}
						)
					}}
					checked={answer.checked}
				/>
				<label for="question-{exam.currentQuestion!.id}-{index}">{answer.label}</label>
			</label>
		{/each}
	</div>
{/if}
