<script lang="ts">
	import { Button } from '$lib/components/ui/button'
	import { Box } from '$lib/components/ui/layout'
	import { _ } from 'svelte-i18n'
	import FileIcon from 'lucide-svelte/icons/paperclip'
	import DownloadIcon from 'lucide-svelte/icons/download'
	import { PUBLIC_DIRECTUS_URL } from '$env/static/public'

	const { data } = $props()

	console.log(data.downloads)
</script>

<Box title={$_('pages.downloads.title')} description={$_('pages.downloads.description')}>
	<div class="flex flex-col gap-2">
		{#each data.downloads as download}
			<span class="flex gap-2">
				<span class="flex flex-grow items-center gap-2 rounded-lg bg-neutral-100 px-6 py-3">
					<FileIcon class="text-neutral-400" />
					{download.filename}
				</span>
				<Button
					variant="secondary"
					href={`${PUBLIC_DIRECTUS_URL}/assets/${download.file}?download`}
					target="_blank"
				>
					<DownloadIcon />
					{$_('common.download')}
				</Button>
			</span>
		{/each}
	</div>
</Box>
