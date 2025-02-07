<script lang="ts">
	import { setExamContext } from '.'
	import { Box } from '../ui/layout'
	import { H } from '../ui/heading'
	import { Button } from '../ui/button'
	import { _ } from 'svelte-i18n'
	import Question from './question.svelte'
	import { untrack } from 'svelte'
	import { exam } from '$lib/stores/app.svelte'

	$effect(() => {
		if (exam.questionTimer && exam.questionTimer.value === 0) {
			untrack(() => exam.nextQuestion())
		}
	})

	exam.started = true
</script>

{#each exam.components as component}
	<!--
        Show info screen before starting the component
    -->
	{#if !component.started && component.isActive}
		<div class="flex flex-grow items-center justify-center">
			<Box class="max-w-2xl">
				{#snippet title()}
					<H level="4" class="mb-4">{component.title}</H>
				{/snippet}
				<div class="prose">
					{@html component.description}
				</div>
				<Button
					variant="secondary"
					onclick={() => {
						component.started = true
					}}
					class="mt-6 px-8"
				>
					{$_('pages.practice_exams.start')}
				</Button>
			</Box>
		</div>
	{/if}

	{#if component.started && component.isActive}
		<Question />
	{/if}
{/each}
