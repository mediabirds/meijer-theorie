<script lang="ts">
	import type { Result } from '$lib/stores/exam/result.svelte'
	import { _ } from 'svelte-i18n'
	import { exam } from '$lib/stores/app.svelte'
	import { getContext, onMount } from 'svelte'
	import { Box } from '$lib/components/ui/layout'
	import { H } from '$lib/components/ui/heading'
	import { Button } from '$lib/components/ui/button'
	import JSConfetti from 'js-confetti'
	import { getExamContext } from './context'

	const context = getExamContext()

	onMount(() => {
		new JSConfetti().addConfetti()
	})
</script>

<Box class="text-center">
	<div class="mx-auto flex max-w-xl flex-col items-center justify-center gap-6">
		<H level="4">{$_('pages.practice_exams.results.passed_title')}</H>
		<span class="text-6xl">🎉</span>
		<span class="font-bold">
			{$_('pages.practice_exams.results.score', {
				values: {
					correctCount: context.outcome.result.correctAnswersCount,
					totalCount: context.outcome.result.totalQuestionsCount
				}
			})}
		</span>
		<p>
			{$_('pages.practice_exams.results.passed_description')}
		</p>
		<Button variant="secondary" onclick={() => (context.showResult = true)}>
			{$_('pages.practice_exams.results.check_answers')}
		</Button>
	</div>
</Box>
<Box>
	<H level="4" class="mb-2">{$_('pages.practice_exams.results.passed_try_again')}</H>
	<span class="block max-w-3xl">
		{$_('pages.practice_exams.results.passed_try_again_description')}
	</span>

	<div class="mt-12 grid grid-cols-1 gap-6 xl:grid-cols-2">
		<div
			class="flex items-center gap-2 rounded-xl bg-neutral-100 p-4"
			style="box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.2);"
		>
			<i class="rounded-md bg-neutral-200 p-2 not-italic">💪</i>
			<span>{$_('pages.practice_exams.results.improve_your_score')}</span>
			<Button class="ms-auto" href="/_/oefenexamens/{exam.id}/intro">
				{$_('pages.practice_exams.results.retake_exam')}
			</Button>
		</div>
		<div
			class="flex items-center gap-2 rounded-xl bg-neutral-100 p-4"
			style="box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.2);"
		>
			<i class="rounded-md bg-neutral-200 p-2 not-italic">🕒</i>
			<span>{$_('pages.practice_exams.results.continue_practicing')}</span>
			<Button class="ms-auto" href="/_/oefenexamens">
				{$_('pages.practice_exams.results.other_exam')}
			</Button>
		</div>
	</div>
</Box>
