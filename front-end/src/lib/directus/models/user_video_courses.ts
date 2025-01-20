import { updateItem, type Query } from '@directus/sdk'
import type { RequestEvent } from '@sveltejs/kit'

export const updateVideoCourse = async (
	event: RequestEvent,
	id: string | number,
	data: Partial<Directus.UserVideoCourses>,
	query?: Query<Directus.CustomDirectusTypes, Directus.UserVideoCourses>
) => {
	// @ts-ignore
	return await event.locals.directus.request(updateItem('user_video_courses', id, data, query))
}
