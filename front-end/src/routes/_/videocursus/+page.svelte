<script lang="ts">
	import { H } from '$lib/components/ui/heading'
	import { Box } from '$lib/components/ui/layout'
	import { cn, getImageUrl } from '$lib/utils.js'
	import { _ } from 'svelte-i18n'

	const { data } = $props()

	console.log(data.courses)
</script>

<Box>
	{#snippet title()}
		{$_('common.chapters')}
	{/snippet}
	<span>Stap voor stap naar je theorie-examen!</span>
	<div class="mt-8 grid lg:grid-cols-2 xl:grid-cols-3">
		{#each data.courses as course}
			<a
				href="/_/videocursus/{course.category}/{course.slug}"
				class={cn(
					'flex flex-col gap-6 rounded-2xl bg-primary-50 p-4',
					'transition-colors hover:bg-primary-100'
				)}
			>
				<header class="flex flex-col">
					<H level="6">{course.title}</H>
					<span>{course.tagline}</span>
				</header>
				<img
					src={getImageUrl(course.thumbnail, { width: 400 })}
					alt={course.title}
					class="aspect-video rounded-xl object-cover"
				/>
			</a>
		{/each}
	</div>
</Box>
