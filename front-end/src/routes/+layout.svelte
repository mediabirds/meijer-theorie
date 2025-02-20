<script lang="ts">
	import { Tooltip } from 'bits-ui'
	import { site, session } from '$lib/stores/app.svelte'
	import { getImageUrl } from '$lib/utils'
	import { GridLoader } from '$lib/components/ui/loader'

	import '@fontsource/poppins/300.css'
	import '@fontsource/poppins/400.css'
	import '@fontsource/poppins/500.css'
	import '@fontsource/poppins/600.css'

	import '../app.css'

	let { children, data } = $props()

	$effect(() => {
		session.set({ ...data.session, user: data.user })
		// @ts-ignore
		site.set({ ...data.globals, isExpired: data.isExpired })
	})
</script>

<svelte:head>
	<link rel="icon" href={getImageUrl(site.favicon, { width: 32 })} sizes="32x32" />
	<link rel="icon" href={getImageUrl(site.favicon, { width: 16 })} sizes="16x16" />
</svelte:head>

{#if site.isLoading}
	<div class="flex h-screen w-screen items-center justify-center">
		<GridLoader />
	</div>
{:else}
	<Tooltip.Provider>
		{@render children()}
	</Tooltip.Provider>
{/if}
