<script lang="ts">
	import { PUBLIC_DIRECTUS_URL } from '$env/static/public'
	import Box from '$lib/components/ui/layout/box.svelte'
	import { site as siteSettings } from '$lib/contexts/app/index.js'
	import { _ } from 'svelte-i18n'

	const { data } = $props()

	const site = siteSettings.get()
	console.log((site.isMenuCollapsed = true))
</script>

<div class="grid grid-cols-[1fr_350px] gap-6">
	<div class="flex flex-col gap-4">
		<Box>
			<nav
				class="mb-4 flex items-center gap-2 text-sm font-medium text-neutral-500"
				aria-label="Breadcrumb"
			>
				<a href="/_/videocursus" class="hover:text-neutral-700">{$_('common.video_courses')}</a>
				<svg
					xmlns="http://www.w3.org/2000/svg"
					class="h-4 w-4"
					fill="none"
					viewBox="0 0 24 24"
					stroke="currentColor"
				>
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
				</svg>
				<a href={`/_/videocursus/${data.course.category}`} class="hover:text-neutral-700"
					>{data.course?.category}</a
				>
				<svg
					xmlns="http://www.w3.org/2000/svg"
					class="h-4 w-4"
					fill="none"
					viewBox="0 0 24 24"
					stroke="currentColor"
				>
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
				</svg>
				<span aria-current="page" class="text-neutral-700">{data.course.title}</span>
			</nav>
			<video src={`${PUBLIC_DIRECTUS_URL}/assets/${data.course.lessons[0].video}`} controls></video>
		</Box>
	</div>
	<div class="flex flex-col gap-4">
		<Box>
			{#snippet title()}
				{$_('common.lesson_content')}
			{/snippet}
			asdasd
		</Box>
	</div>
</div>
