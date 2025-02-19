<script lang="ts">
	import { Box } from '$lib/components/ui/layout'
	import { page } from '$app/state'
	import { H } from '$lib/components/ui/heading'
	import { _ } from 'svelte-i18n'
	import { Button } from '$lib/components/ui/button'
</script>

<div class="flex h-dvh flex-col items-center justify-center">
	<div class="container">
		<Box class="flex flex-col items-center justify-center gap-4 text-center">
			<span class="text-[100px]">🚧</span>
			<H level="2">{page.status === 404 ? $_('common.404_title') : $_('common.500_title')}</H>
			<p class="max-w-md">
				{page.status === 404 ? $_('common.404_description') : $_('common.500_description')}
			</p>
			<Button variant="secondary" href="/_"
				>{page.status === 404 ? $_('common.404_button') : $_('common.500_description')}</Button
			>
		</Box>
	</div>
</div>
