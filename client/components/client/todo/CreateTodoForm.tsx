"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "../../ui/button"
import { Input } from "../../ui/input"
import { Label } from "../../ui/label"
import { createTodo } from "@/utils/todos/createTodo"

type CreateUserFormProps = {
    listId: number
}

export default function CreateUserForm({ listId }: CreateUserFormProps) {
    const router = useRouter()
    const [title, setTitle] = useState("")
    const [description, setDescription] = useState("")
    const [completed, setCompleted] = useState(false)
    return (
        <form onSubmit={(e) => {
            createTodo(e, listId, title, description, completed);
            setTitle("")
            setDescription("")
            setCompleted(false)
            router.refresh();
        }} className="flex gap-2 justify-center items-center p-8 text-2xl w-full">
            <Label className="text-2xl" htmlFor="title">Todo</Label>
            <Input type="text" name="title" value={title} onChange={e => setTitle(e.target.value)} />
            <Label className="text-2xl" htmlFor="description">Description</Label>
            <Input type="text" name="description" value={description} onChange={e => setDescription(e.target.value)} />
            <Label className="text-2xl" htmlFor="completed">Completed</Label>
            <Input className="w-24" type="checkbox" name="completed" checked={completed} onChange={e => setCompleted(e.target.checked)} />
            <Button className="text-blue-400 hover:text-blue-300 transition-all" type="submit">Add Todo</Button>
        </form>
    )
}