<script lang="ts">
	import type { PracticeExam } from '$lib/server/services/practice-exam'
	import { _ } from 'svelte-i18n'
	import { Button } from '$lib/components/ui/button'
	import { cn } from '$lib/utils'
	import { exam as examStore } from '$lib/stores/app.svelte'

	type Props = {
		exam: PracticeExam
		index: number
		didPass?: boolean | null
	}

	let { exam, index, didPass = $bindable(undefined) }: Props = $props()
</script>

<div class="flex items-center gap-12">
	<span
		class={cn(
			'flex flex-grow gap-2 rounded-full bg-neutral-100 px-6 py-2 text-sm font-medium',
			true === didPass && 'bg-success-100 text-success',
			false === didPass && 'bg-destructive-100 text-destructive'
		)}
	>
		<span>#{index}</span>
		<span>{exam.title}</span>
	</span>
	<Button
		variant={didPass === undefined || didPass === null ? 'secondary' : 'default'}
		class="w-24"
		href="/_/oefenexamens/{exam.id}/intro"
	>
		{#if didPass === undefined || didPass === null}
			{$_('pages.practice_exams.start')}
		{:else}
			{$_('pages.practice_exams.again')}
		{/if}
	</Button>
</div>
