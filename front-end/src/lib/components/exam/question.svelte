<script lang="ts">
	import { getImageUrl } from '$lib/utils'
	import { Button } from '../ui/button'
	import { Box } from '../ui/layout'
	import { _ } from 'svelte-i18n'
	import ArrowRightIcon from 'lucide-svelte/icons/arrow-right'
	import MultipleChoiceQuestion from './questions/multiple-choice-question.svelte'
	import InOrderQuestion from './questions/in-order-question.svelte'
	import { H } from '../ui/heading'
	import { goto } from '$app/navigation'
	import { exam } from '$lib/stores/app.svelte'

	let isSaving = $state(false)
</script>

<div class="container mt-2 flex flex-col gap-6">
	<div class="grid gap-6 md:grid-cols-[1fr_420px]">
		<Box>
			<img
				src={getImageUrl(exam.currentQuestion!.item.thumbnail, { width: 1200 })}
				alt={exam.currentQuestion?.item.title}
			/>
		</Box>
		<Box>
			<div class="mb-4 flex items-center justify-between">
				<span>
					{$_('common.question')}
					{exam.currentQuestionIndex + 1}/{exam.currentComponent?.questions.length}
				</span>
			</div>
			<H level="6" class="mb-4">
				{exam.currentQuestion!.item.title}
			</H>
			{#if exam.currentQuestion?.collection === 'questions_multiple_choice'}
				<MultipleChoiceQuestion />
			{/if}
			{#if exam.currentQuestion?.collection === 'questions_in_order'}
				<InOrderQuestion />
			{/if}
		</Box>
	</div>
	<div>
		<Box>
			<div class="grid grid-cols-1 items-center gap-y-6 md:grid-cols-3">
				<span class="flex items-center justify-center gap-2 md:col-start-3 md:justify-end">
					{#if exam.didReachEnd}
						{$_('pages.practice_exams.result')}
					{:else}
						{$_('pages.practice_exams.next_question')}
					{/if}
					<Button
						size="icon"
						variant="secondary"
						type="button"
						onclick={() => {
							if (exam.didReachEnd) {
								isSaving = true

								fetch('/api/exams/result', {
									method: 'POST',
									body: JSON.stringify({
										id: exam.id,
										components: $state.snapshot(exam.components)
									})
								}).then(() => {
									setTimeout(() => {
										goto(`/_/oefenexamens/${exam.id}/uitslag`, { invalidateAll: true })
										isSaving = false
									}, 500)
								})
							} else {
								exam.nextQuestion()
							}
						}}
						spinner={isSaving}
					>
						{#if !isSaving}
							<ArrowRightIcon />
						{/if}
					</Button>
				</span>
			</div>
		</Box>
	</div>
</div>
