"use client"

import { createRole } from "@/utils/roles/createRole"
import { useState } from "react"

export default function CreateRoleForm() {
    const [roleName, setRoleName] = useState("")
    const [description, setDescription] = useState("")

    return (
        <form onSubmit={(e) => createRole(e, roleName, description)}>
            <label htmlFor="role_name">Role Name</label>
            <input type="text" id="role_name" name="role_name" value={roleName} onChange={e => setRoleName(e.target.value)} />
            <label htmlFor="description">Description</label>
            <input type="text" id="description" name="description" value={description} onChange={e => setDescription(e.target.value)} />
            <button type="submit">Add Role</button>
        </form>
    )
}