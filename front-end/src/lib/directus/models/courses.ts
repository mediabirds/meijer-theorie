import { readItems, type Query } from '@directus/sdk'
import { error, type RequestEvent } from '@sveltejs/kit'

export const getCourses = async (
	event: RequestEvent,
	query?: Query<Directus.CustomDirectusTypes, Directus.VideoCourses>
) => {
	if (!event.locals.user) {
		return error(401, 'UNAUTHORIZED')
	}

	const defaultQuery: Query<Directus.CustomDirectusTypes, Directus.VideoCourses> = {
		...query,
		fields: ['*', { lessons: ['*'] }]
	}

	if (query?.fields) {
		// @ts-ignore
		defaultQuery.fields = [
			// @ts-ignore
			...defaultQuery.fields,
			...query.fields
		]
	}

	const courses = await event.locals.directus.request<
		Directus.SchemaMapper<
			Directus.VideoCourses,
			{
				lessons: Directus.VideoCoursesLessons[]
			}
		>[]
	>(readItems('video_courses', defaultQuery))

	return {
		courses
	}
}

export const getCourse = async (
	event: RequestEvent,
	query?: Query<Directus.CustomDirectusTypes, Directus.VideoCourses>
) => {
	const { courses } = await getCourses(event, query)

	if (courses.length === 0) {
		return null
	}

	return courses[0]
}
