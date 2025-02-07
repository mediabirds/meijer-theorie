<script lang="ts">
	import { Result } from '$lib/stores/exam/result.svelte'
	import { _ } from 'svelte-i18n'
	import DidNotPass from './did-not-pass.svelte'
	import ResultView from './result.svelte'
	import { onMount, setContext } from 'svelte'
	import { page } from '$app/state'

	let result = $state<Result>()

	onMount(() => {
		result = new Result(page.params.id)
		setContext('EXAM_RESULT', result)
	})
</script>

{#if result}
	<div class="flex flex-col gap-6">
		{#if result.showResult}
			<ResultView />
		{:else if result.didPass === false}
			<DidNotPass />
		{/if}
	</div>
{/if}
