<script lang="ts">
	import { _ } from 'svelte-i18n'
	import { cn } from '$lib/utils'
	import QuestionMultipleChoice from './question-multiple-choice.svelte'
	import { H } from '$lib/components/ui/heading'

	type Props = {
		question: Directus.SchemaMapper<
			Directus.PracticeExamsComponentsQuestions,
			{
				item: {
					thumbnail: string
					title: string
					answers: { label: string; isCorrectAnswer: boolean }[]
				}
			}
		>
	}

	let { question }: Props = $props()
</script>

{#if question.collection === 'questions_multiple_choice'}
	<H level="6">{question.item.title}</H>
	<QuestionMultipleChoice answers={question.item.answers} />
{/if}
