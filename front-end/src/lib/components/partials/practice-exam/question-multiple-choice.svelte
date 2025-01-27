<script lang="ts">
	import Radio from '$lib/components/ui/input/radio.svelte'
	import { cn } from '$lib/utils'

	type Props = {
		id: number
		thumbnail: string
		title: string
		answers: {
			label: string
			isCorrectAnswer: boolean
		}[]
	}

	let { title, answers, thumbnail, id }: Props = $props()

	console.log(title, answers, thumbnail, id)
</script>

<div class="mt-2 flex flex-col gap-2">
	{#each answers as answer, i}
		<label
			class={cn(
				'rounded-lg bg-neutral-100 px-6 py-4 has-[:checked]:ring-2 has-[:checked]:ring-primary'
			)}
		>
			<input type="radio" value={answer.label} name="question-{id}" id="question-{id}-{i}" />
			<label class="font-medium" for="question-{id}-{i}">{answer.label}</label>
		</label>
	{/each}
</div>
