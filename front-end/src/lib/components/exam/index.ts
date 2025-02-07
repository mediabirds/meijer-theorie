import type { Exam } from '$lib/stores/exam/exam.svelte'
import { getContext, setContext } from 'svelte'
import Component from './component.svelte'
import RootExam from './exam.svelte'

export const KEY = Symbol

export function setExamContext(exam: Exam) {
	return setContext(KEY, exam)
}

export function getExamContext() {
	return getContext<ReturnType<typeof setExamContext>>(KEY)
}

export { Component, RootExam as Exam }
