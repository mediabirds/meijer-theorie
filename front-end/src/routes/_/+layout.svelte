<script lang="ts">
	let { children } = $props()
</script>

{@render children()}

<div class="flex min-h-screen flex-col gap-12">
	<div class="grid flex-grow grid-cols-[350px_1fr]">
		<aside class="flex flex-col gap-12 rounded-ee-3xl bg-white p-8 shadow-lg">
			<span class="text-2xl font-bold">MeijerTheorie</span>
			<nav class="flex flex-col gap-4">
				<a href="/" class="flex items-center gap-4">
					<span
						class="flex h-11 w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
					>
						<span class="relative -mt-1">📚</span>
					</span>
					<span>Dashboard</span>
				</a>
				<a href="/" class="flex items-center gap-4">
					<span
						class="flex h-11 w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
					>
						<span class="relative -mt-1">💻</span>
					</span>
					<span>Videocursus</span>
				</a>
				<a href="/" class="flex items-center gap-4">
					<span
						class="flex h-11 w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
					>
						<span class="relative -mt-1">📝</span>
					</span>
					<span>Oefenexamens</span>
				</a>
				<a href="/" class="flex items-center gap-4">
					<span
						class="flex h-11 w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
					>
						<span class="relative -mt-1">👤</span>
					</span>
					<span>Account</span>
				</a>
			</nav>
		</aside>
		<div>
			<header class="flex items-center justify-between bg-white shadow-sm">
				<span>Hi Matthijs!</span>
				<span>Spoedpakket lambo</span>
			</header>
			<main>
				{@render children()}
			</main>
		</div>
	</div>
	<footer></footer>
</div>
