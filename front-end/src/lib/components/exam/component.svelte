<script lang="ts">
	import { onMount } from 'svelte'
	import { getExamContext } from '.'

	const exam = getExamContext()

	onMount(() => {
		console.log(exam)
	})
</script>
