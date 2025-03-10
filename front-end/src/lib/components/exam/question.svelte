<script lang="ts">
	import { _ } from 'svelte-i18n'
	import { getImageUrl } from '$lib/utils'
	import { Button } from '../ui/button'
	import { Box } from '../ui/layout'
	import { H } from '../ui/heading'
	import { goto } from '$app/navigation'
	import { exam } from '$lib/stores/app.svelte'
	import ArrowLeftIcon from 'lucide-svelte/icons/arrow-left'
	import ArrowRightIcon from 'lucide-svelte/icons/arrow-right'
	import InOrderQuestion from './questions/in-order-question.svelte'
	import MultipleChoiceQuestion from './questions/multiple-choice-question.svelte'

	let isSaving = $state(false)
	let showPrevButton = $derived(
		!exam.currentComponent?.timeLimitPerQuestionSeconds && exam.hasPrevQuestion
	)
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
			<div class="grid grid-cols-3">
				<span class="flex items-center gap-2">
					{#if showPrevButton}
						<Button
							size="icon"
							variant="secondary"
							type="button"
							onclick={() => exam.gotoPrevQuestion()}
						>
							{#if !isSaving}
								<ArrowLeftIcon />
							{/if}
						</Button>
						<span class="hidden md:block">
							{#if exam.didReachEnd}
								{$_('pages.practice_exams.result')}
							{:else}
								{$_('pages.practice_exams.prev_question')}
							{/if}
						</span>
					{/if}
				</span>
				{#if exam.questionTimer}
					<span class="flex items-center justify-center">
						<span class="relative top-[1px] w-6 font-medium"
							>{(exam.questionTimer.value / 1000).toFixed(0)}</span
						>
						<span class="block h-4 w-16 overflow-clip rounded-full bg-primary-200">
							<span
								class="block h-full w-full bg-primary"
								style={`width: ${100 - (exam.questionTimer.value / 1000 / exam.currentComponent!.timeLimitPerQuestionSeconds!) * 100}%;`}
							></span>
						</span>
					</span>
				{/if}
				<div class="col-start-3 flex items-center justify-end gap-2">
					<span class="hidden md:block">
						{#if exam.didReachEnd}
							{$_('pages.practice_exams.result')}
						{:else}
							{$_('pages.practice_exams.next_question')}
						{/if}
					</span>
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
								exam.gotoNextQuestion()
							}
						}}
						spinner={isSaving}
					>
						{#if !isSaving}
							<ArrowRightIcon />
						{/if}
					</Button>
				</div>
			</div>
		</Box>
	</div>
</div>
