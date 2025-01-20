<script lang="ts">
	import { Tooltip } from 'bits-ui'
	import { site, session } from '$lib/stores/app.svelte'
	import { onMount } from 'svelte'

	import '../app.css'
	import { getImageUrl } from '$lib/utils'

	let { children, data } = $props()

	onMount(() => {
		session.set({ ...data.session, user: data.user })
		// @ts-ignore
		site.set({ ...data.globals })
	})
</script>

<svelte:head>
	<link rel="icon" href={getImageUrl(site.favicon, { width: 32 })} sizes="32x32" />
	<link rel="icon" href={getImageUrl(site.favicon, { width: 16 })} sizes="16x16" />
</svelte:head>

<Tooltip.Provider>
	{@render children()}
</Tooltip.Provider>
