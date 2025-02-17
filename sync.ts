// @ts-ignore
process.stdout.write("\x1b[1m---- SYNCING SCHEMA'S ----\x1b[0m\n\n")

if (!Bun.env.DIRECTUS_REMOTE_URL) {
	const prompt =
		Bun.color('#50FA7B', 'ansi') + 'Enter remote Directus URL: ' + Bun.color('white', 'ansi')
	process.stdout.write(prompt)

	for await (const line of console) {
		Bun.env.DIRECTUS_REMOTE_URL = line
		break
	}

	console.log(
		Bun.color('blue', 'ansi') +
			'Remote URL: ' +
			Bun.color('white', 'ansi') +
			Bun.env.DIRECTUS_REMOTE_URL! +
			'\n'
	)
}

if (!Bun.env.DIRECTUS_LOCAL_URL) {
	const prompt =
		Bun.color('#50FA7B', 'ansi') + 'Enter local Directus URL: ' + Bun.color('white', 'ansi')
	process.stdout.write(prompt)

	for await (const line of console) {
		Bun.env.DIRECTUS_LOCAL_URL = line
		break
	}

	console.log(
		Bun.color('blue', 'ansi') +
			'Local URL: ' +
			Bun.color('white', 'ansi') +
			Bun.env.DIRECTUS_REMOTE_URL! +
			'\n'
	)
}

if (!Bun.env.DIRECTUS_TOKEN) {
	const prompt = Bun.color('#50FA7B', 'ansi') + 'Enter access token: ' + Bun.color('white', 'ansi')
	process.stdout.write(prompt)

	for await (const line of console) {
		Bun.env.DIRECTUS_TOKEN = line
		break
	}

	console.log(
		Bun.color('blue', 'ansi') +
			'Access token: ' +
			Bun.color('white', 'ansi') +
			Bun.env.DIRECTUS_REMOTE_URL! +
			'\n'
	)
}

const headers = {
	Authorization: 'Bearer ' + Bun.env.DIRECTUS_TOKEN,
	'Content-Type': 'application/json'
}

console.log('⭕ Checking for changes...')

const snapshotRequest = await fetch(Bun.env.DIRECTUS_LOCAL_URL! + '/schema/snapshot', { headers })
const snapshotResponse = await snapshotRequest.json()

const diffRequest = await fetch(Bun.env.DIRECTUS_REMOTE_URL! + '/schema/diff', {
	method: 'POST',
	headers,
	body: JSON.stringify(snapshotResponse.data)
})
const diffResponse = await diffRequest.json()

if (diffResponse === null) {
	console.log('❌ No changes detected')
	process.exit(0)
}

console.log('⚠️  Changes detected')
console.log('🔁 Applying changes...')

const updateRequest = await fetch(Bun.env.DIRECTUS_REMOTE_URL! + '/schema/apply', {
	method: 'POST',
	headers,
	body: JSON.stringify(diffResponse.data)
})
const updateResponse = await updateRequest.json()

console.log('✅ Schema synced')
process.exit(0)

export {}
