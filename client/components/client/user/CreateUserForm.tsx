"use client"

import { createRole } from "@/utils/roles/createRole"
import { useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "../../ui/button"
import { Input } from "../../ui/input"
import { Label } from "../../ui/label"
import createUser from "@/utils/users/createUser"

type CreateUserFormProps = {
    roles: Role[]
}

export default function CreateUserForm({ roles }: CreateUserFormProps) {
    const router = useRouter()
    const [firstName, setFirstName] = useState("")
    const [lastName, setLastName] = useState("")
    const [email, setEmail] = useState("")
    const [roleId, setRoleId] = useState(0)

    return (
        <form onSubmit={(e) => {
            createUser(e, firstName, lastName, email, roleId)
            setFirstName("")
            setLastName("")
            setEmail("")
            setRoleId(0)
            router.refresh();
        }} className="flex gap-2 justify-center items-center p-8 text-2xl w-full">
            <Label className="text-2xl" htmlFor="first_name">First Name</Label>
            <Input className="w-1/4" type="text" name="first_name" value={firstName} onChange={e => setFirstName(e.target.value)} />
            <Label className="text-2xl" htmlFor="last_name">Last Name</Label>
            <Input className="w-1/4" type="text" name="last_name" value={lastName} onChange={e => setLastName(e.target.value)} />
            <Label className="text-2xl" htmlFor="email">Email</Label>
            <Input className="w-1/4" type="text" name="email" value={email} onChange={e => setEmail(e.target.value)} />
            <Label className="text-2xl" htmlFor="role_id">Role</Label>
            <select className="w-1/4" name="role_id" value={roleId} onChange={e => setRoleId(parseInt(e.target.value))}>
                <option value={0}>Select a role</option>
                {roles.map(role => <option key={role.ROLE_ID} value={role.ROLE_ID}>{role.ROLE_NAME}</option>)}
            </select>
            <Button className="text-blue-400 hover:text-blue-300 transition-all" type="submit">Add User</Button>
        </form>
    )
}