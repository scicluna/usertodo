"use client"
import { deleteRole } from "@/utils/roles/deleteRole"
import { editRole } from "@/utils/roles/editRole"
import Link from "next/link"
import { useRouter } from "next/navigation"
import { useState } from "react"
import EditRolePopover from "./EditRolePopover"

type RoleItemProps = {
    role: Role
}

export default function RoleItem({ role }: RoleItemProps) {
    const router = useRouter();
    const [name, setName] = useState(role.ROLE_NAME)

    async function deleteRoleAndRevalidate(roleId: number) {
        await deleteRole(roleId);
        router.refresh();
    }

    return (
        <div className="flex gap-2">
            <Link href={`/roles/${role.ROLE_ID}`}>{role.ROLE_NAME} --</Link>
            <button className="text-blue-400 hover:text-blue-300 transition-all" type="button" onClick={() => deleteRoleAndRevalidate(role.ROLE_ID)}>Delete --</button>
            <EditRolePopover role={role} name={name} setName={setName} router={router} />
        </div>
    )
}