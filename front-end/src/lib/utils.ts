import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'
import { PUBLIC_DIRECTUS_URL } from '$env/static/public'

export type TransformOptions = {
	fit?: 'cover' | 'contain' | 'fill' | 'inside' | 'outside'
	width?: number
	height?: number
	quality?: number
}

/**
 * Merges multiple class names into a single string.
 *
 * This function uses the `clsx` library to merge the given class names into a single string.
 * It also removes any duplicate class names.
 *
 * @example
 * cn('text-red-500', 'hover:text-red-700') // 'text-red-500 hover:text-red-700'
 * cn('text-red-500', 'text-red-500') // 'text-red-500'
 * @param {...ClassValue} inputs The class names to merge.
 * @returns A single string containing the merged class names.
 */
export function cn(...inputs: ClassValue[]) {
	return twMerge(clsx(inputs))
}

/**
 * Checks if the given string is a valid UUID.
 *
 * @example
 * isUUID('123e4567-e89b-12d3-a456-426614174000') // true
 * isUUID('not a uuid') // false
 * @param str The string to check.
 * @returns Whether the given string is a valid UUID.
 */
export const isUUID = (str: string) =>
	/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(str)

/**
 * Checks if the given string is a valid URL.
 *
 * @example
 * isURL('https://example.com') // true
 * isURL('not a url') // false
 * @param str The string to check.
 * @returns Whether the given string is a valid URL.
 */
export const isURL = (str: string) => /^(https?|http):\/\/[^\s/$.?#].[^\s]*$/i.test(str)

/**
 * Returns a URL for the given image.
 *
 * If the image is a file from Directus, it will generate a URL for the file.
 * If the image is a URL, it will return the URL as is.
 *
 * @example
 * getImageUrl('123e4567-e89b-12d3-a456-426614174000') // https://website.com/assets/123e4567-e89b-12d3-a456-426614174000
 * getImageUrl('https://example.com/image.jpg') // https://example.com/image.jpg
 * @param image The image to get the URL for.
 * @param options Options for the image URL.
 * @returns The URL of the image.
 */
export const getImageUrl = (
	image: Directus.DirectusFiles | string,
	options?: TransformOptions
): string => {
	let queryString = ''

	if (options) {
		queryString = Object.keys(options)
			.filter((k) => options[k as keyof typeof options] !== undefined)
			.map(
				(k) =>
					`${encodeURIComponent(k)}=${encodeURIComponent(options[k as keyof typeof options] as unknown as string)}`
			)
			.join('&')
	}

	if (typeof image === 'string') {
		if (isUUID(image)) {
			return `${PUBLIC_DIRECTUS_URL}/assets/${image}${queryString ? '?' + queryString : ''}`
		}

		return image
	}

	if (!image || !image.id) {
		return `${PUBLIC_DIRECTUS_URL}/assets/acd81530-b449-41cf-abe3-8c99a5f287a3${queryString ? '?' + queryString : ''}`
	}

	return `${PUBLIC_DIRECTUS_URL}/assets/${image.id}${queryString ? '?' + queryString : ''}`
}

export function toHoursAndMinutes(totalMinutes: number) {
	const hours = Math.floor(totalMinutes / 60)
	const minutes = totalMinutes % 60

	return { hours, minutes }
}

export const tryer = async <T, E>(fn: () => Promise<T>): Promise<[T | null, E | null]> => {
	try {
		const data = await fn()
		return [data, null] as const
	} catch (e: unknown) {
		return [null, e as E]
	}
}
