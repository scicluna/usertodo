"use client"

import { createRole } from "@/utils/roles/createRole"
import { useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "../ui/button"
import { Input } from "../ui/input"
import { Label } from "../ui/label"

export default function CreateRoleForm() {
    const router = useRouter()
    const [roleName, setRoleName] = useState("")
    const [description, setDescription] = useState("")

    return (
        <form onSubmit={(e) => {
            createRole(e, roleName, description)
            setRoleName("")
            setDescription("")
            router.refresh();
        }} className="flex gap-2 justify-center items-center p-8 text-2xl w-full">
            <Label className="text-2xl" htmlFor="role_name">Role Name</Label>
            <Input className="w-1/4" type="text" id="role_name" name="role_name" value={roleName} onChange={e => setRoleName(e.target.value)} />
            <Button className="text-blue-400 hover:text-blue-300 transition-all" type="submit">Add Role</Button>
        </form>
    )
}