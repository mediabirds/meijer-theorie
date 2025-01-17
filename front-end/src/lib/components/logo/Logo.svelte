<script lang="ts">
	import { globals } from '$lib/contexts/app'
	import { getImageUrl } from '$lib/utils'
	import type { HTMLImgAttributes } from 'svelte/elements'

	type Props = Omit<HTMLImgAttributes, 'src' | 'alt'>

	const { ...restProps } = $props()
</script>

<a href="/">
	<img src={getImageUrl(globals.get().logo)} alt="Meijer Theorie" {...restProps} />
</a>
