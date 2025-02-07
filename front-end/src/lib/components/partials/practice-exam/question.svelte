<script lang="ts">
	import { _ } from 'svelte-i18n'
	import { cn, getImageUrl } from '$lib/utils'
	import QuestionMultipleChoice from './question-multiple-choice.svelte'
	import { H } from '$lib/components/ui/heading'
	import { Box } from '$lib/components/ui/layout'
	import type { Component } from '$lib/stores/exam/exam.svelte'
	import { exam } from '$lib/stores/app.svelte'

	type Props = {
		question: Component['questions'][number]
	}

	let { question }: Props = $props()
</script>

<div class="grid grid-cols-[1fr_400px] gap-6">
	{#if question.item.thumbnail}
		<Box>
			<div class="flex items-center justify-center">
				<img
					src={getImageUrl(question.item.thumbnail, { width: 1200 })}
					alt={question.item.title}
					class="rounded-lg"
				/>
			</div>
		</Box>
	{/if}
	<Box>
		<div class="flex flex-col gap-4">
			<H level="5">{question.item.title}</H>
			{#if question.collection === 'questions_multiple_choice'}
				<QuestionMultipleChoice {question} onanswer={(question) => {}} />
			{/if}
		</div>
	</Box>
</div>

<!-- {#if question.collection === 'questions_multiple_choice'}
	<H level="6">{question.item.title}</H>
	<QuestionMultipleChoice answers={question.item.answers} />
{/if} -->
