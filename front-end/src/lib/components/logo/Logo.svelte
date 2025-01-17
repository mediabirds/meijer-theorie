<script lang="ts">
	import { globals } from '$lib/contexts/app'
	import { site } from '$lib/stores/app.svelte'
	import { getImageUrl } from '$lib/utils'
	import type { HTMLImgAttributes } from 'svelte/elements'

	type Props = Omit<HTMLImgAttributes, 'src' | 'alt'>

	const { ...restProps } = $props()
</script>

<a href="/">
	<img src={getImageUrl(site.logo)} alt="Meijer Theorie" {...restProps} />
</a>
