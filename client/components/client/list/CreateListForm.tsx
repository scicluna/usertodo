"use client"

import { createRole } from "@/utils/roles/createRole"
import { useState } from "react"
import { useRouter } from "next/navigation"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Label } from "@/components/ui/label"
import { createList } from "@/utils/todos/createList"

type CreateListFormProps = {
    userId: number
}

export default function CreateListForm({ userId }: CreateListFormProps) {
    const router = useRouter()
    const [listName, setListName] = useState("")

    return (
        <form onSubmit={(e) => {
            createList(e, userId, listName)
            setListName("")
            router.refresh();
        }} className="flex gap-2 justify-center items-center p-8 text-2xl w-full">
            <Label className="text-2xl" htmlFor="role_name">List Name</Label>
            <Input className="w-1/4" type="text" id="role_name" name="role_name" value={listName} onChange={e => setListName(e.target.value)} />
            <Button className="text-blue-400 hover:text-blue-300 transition-all" type="submit">Add List</Button>
        </form>
    )
}