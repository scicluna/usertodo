"use client"
import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from "@/components/ui/popover"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { editRole } from "@/utils/roles/editRole"
import { Label } from "@radix-ui/react-label"
import { editTodo } from "@/utils/todos/editTodo"


type TodoEditPopoverProps = {
    todo: Todo
    title: string
    description: string
    completed: boolean
    setTitle: (name: string) => void
    setDescription: (description: string) => void
    setCompleted: (completed: boolean) => void
    router: any
    disabled: boolean
}

export default function TodoEditPopover({ todo, title, description, completed, setTitle, setDescription, setCompleted, router, disabled }: TodoEditPopoverProps) {

    async function editTodoAndRevalidate(todoId: number, title: string, description: string, completed: boolean) {
        await editTodo(todoId, title, description, completed);

        router.refresh();
    }

    return (
        <Popover>
            <PopoverTrigger className="text-blue-400 hover:text-blue-300 transition-all">Edit</PopoverTrigger>
            <PopoverContent className="flex flex-col gap-4">
                <form>
                    <Label className="text-2xl" htmlFor="todo">Title</Label>
                    <Input type="text" value={title} onChange={e => setTitle(e.target.value)} />
                    <Label className="text-2xl" htmlFor="description">Description</Label>
                    <textarea className="bg-slate-100 p-2" rows={10} value={description} onChange={e => setDescription(e.target.value)} />
                    <Button disabled={disabled} variant="outline" onClick={() => editTodoAndRevalidate(todo.TODO_ID, title, description, completed)}>Confirm</Button>
                </form>
            </PopoverContent>
        </Popover>
    )
}