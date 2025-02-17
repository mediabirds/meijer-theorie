<script lang="ts">
	import { VideoCourse } from '$lib/components/partials/video-course'
	import { _ } from 'svelte-i18n'

	const { data } = $props()
</script>

<div class="grid gap-4 lg:grid-cols-2 xl:grid-cols-3">
	{#each data.courses as course}
		<VideoCourse {course} />
	{/each}
</div>
