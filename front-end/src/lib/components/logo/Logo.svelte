<script lang="ts">
	import { globals } from '$lib/contexts/app'
	import { site } from '$lib/stores/app.svelte'
	import { getImageUrl } from '$lib/utils'
	import type { HTMLImgAttributes } from 'svelte/elements'

	type Props = { thumbnail?: boolean } & Omit<HTMLImgAttributes, 'src' | 'alt'>

	const { thumbnail, ...restProps }: Props = $props()
</script>

<a href="/">
	{#if thumbnail}
		<img src={getImageUrl(site.favicon)} alt="Meijer Theorie" {...restProps} />
	{:else}
		<img src={getImageUrl(site.logo)} alt="Meijer Theorie" {...restProps} />
	{/if}
</a>
