"use client"
import { useRouter } from "next/navigation"
import { useState } from "react"
import { Button } from "../../ui/button"
import { Input } from "@/components/ui/input"
import TodoEditPopover from "./TodoEditPopover"
import TodoHover from "./TodoHover"
import { deleteTodo } from "@/utils/todos/deleteTodo"
import { editTodo } from "@/utils/todos/editTodo"

type TodoItemProps = {
    todo: Todo
}

export default function TodoItem({ todo }: TodoItemProps) {
    const router = useRouter();
    const [title, setTitle] = useState(todo.TITLE)
    const [description, setDescription] = useState(todo.DESCRIPTION || "")
    const [completed, setCompleted] = useState(todo.COMPLETED)
    const [disabled, setDisabled] = useState(false)

    async function deleteTodoAndRevalidate(todoId: number) {
        await deleteTodo(todoId);
        router.refresh();
    }

    async function checkChange(todoId: number, completed: boolean) {
        setDisabled(true);
        await editTodo(todoId, title, description, completed);
        setDisabled(false);
    }

    return (
        <div key={todo.TODO_ID} className="flex gap-2">
            <TodoHover title={todo.TITLE} description={todo.DESCRIPTION || ""} />
            <Input disabled={disabled} className="w-24" type="checkbox" name="completed" checked={completed}
                onChange={e => {
                    setCompleted(e.target.checked)
                    checkChange(todo.TODO_ID, e.target.checked)
                }} />
            <Button disabled={disabled} className="text-blue-400 hover:text-blue-300 transition-all" type="button" onClick={() => deleteTodoAndRevalidate(todo.TODO_ID)}>Delete</Button>
            <TodoEditPopover todo={todo} title={title} description={description} completed={completed} setTitle={setTitle} setDescription={setDescription} setCompleted={setCompleted} router={router} disabled={disabled} />
        </div>
    )
}