<script lang="ts">
	import { page } from '$app/state'
	import Question from '$lib/components/partials/practice-exam/question.svelte'
	import { Button } from '$lib/components/ui/button'
	import { H } from '$lib/components/ui/heading'
	import { Box } from '$lib/components/ui/layout'
	import { exam } from '$lib/stores/app.svelte'
	import { getImageUrl } from '$lib/utils'
	import ArrowRightIcon from 'lucide-svelte/icons/arrow-right'
	import { _ } from 'svelte-i18n'
</script>

<div class="container mt-6 flex flex-grow flex-col">
	{#if !exam.currentComponent?.started}
		<div class="flex flex-grow items-center justify-center">
			<Box class="max-w-2xl">
				{#snippet title()}
					<H level="4" class="mb-4">{exam.currentComponent?.title}</H>
				{/snippet}
				<div class="prose">
					{@html exam.currentComponent?.description}
				</div>
				<Button
					variant="secondary"
					onclick={() => {
						exam.currentComponent!.started = true
					}}
					class="mt-6 px-8"
				>
					{$_('pages.practice_exams.start')}
				</Button>
			</Box>
		</div>
	{:else}
		{#if exam.currentQuestion}
			<Question question={exam.currentQuestion} />
		{/if}
		<div class="mt-6">
			<Box>
				<div class="grid grid-cols-3 items-center">
					{#if exam.componentTimer}
						<span class="col-start-2 text-center">
							{@html $_('pages.practice_exams.time_remaining', {
								values: { time: `${exam.componentTimer.minutes}:${exam.componentTimer.seconds}` }
							})}
						</span>
					{/if}
					<span class="col-start-3 flex items-center justify-end gap-2">
						{$_('pages.practice_exams.next_question')}
						<Button
							size="icon"
							variant="secondary"
							type="button"
							onclick={() => exam.nextQuestion()}
						>
							<ArrowRightIcon />
						</Button>
					</span>
				</div>
			</Box>
		</div>
	{/if}
</div>
