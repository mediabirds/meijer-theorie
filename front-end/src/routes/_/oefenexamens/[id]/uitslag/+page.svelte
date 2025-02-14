<script lang="ts">
	import { _ } from 'svelte-i18n'
	import DidNotPass from './did-not-pass.svelte'
	import ResultView from './result.svelte'
	import DidPass from './did-pass.svelte'
	import { setContext } from 'svelte'
	import { setExamContext } from './context'

	let { data } = $props()
	let context = $state({ outcome: data.practiceExam, showResult: false })

	setExamContext(context)
</script>

<div class="flex flex-col gap-6">
	{#if context.showResult}
		<ResultView />
	{:else if context.outcome.didPass === false}
		<DidNotPass />
	{:else}
		<DidPass />
	{/if}
</div>
