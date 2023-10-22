"use client"
import Link from "next/link"
import { useRouter } from "next/navigation"
import { useState } from "react"
import { Button } from "../../ui/button"
import EditUserPopover from "./EditUserPopover"
import { deleteUser } from "@/utils/users/deleteUser"

type UserItemProps = {
    user: User
    roles: Role[]
}

export default function RoleItem({ user, roles }: UserItemProps) {
    const router = useRouter();
    const [firstName, setFirstName] = useState(user.FIRST_NAME)
    const [lastName, setLastName] = useState(user.LAST_NAME)
    const [email, setEmail] = useState(user.EMAIL)
    const [roleId, setRoleId] = useState(user.ROLE)

    async function deleteUserAndRevalidate(userId: number) {
        await deleteUser(userId);
        router.refresh();
    }

    return (
        <div className="flex gap-2">
            <Link href={`/users/${user.USER_ID}`}>{user.EMAIL} --</Link>
            <Button className="text-blue-400 hover:text-blue-300 transition-all" type="button" onClick={() => deleteUserAndRevalidate(user.USER_ID)}>Delete</Button>
            <EditUserPopover user={user} firstName={firstName} lastName={lastName} email={email} roleId={roleId} roles={roles} setFirstName={setFirstName} setLastName={setLastName} setEmail={setEmail} setRoleId={setRoleId} router={router} />
        </div>
    )
}