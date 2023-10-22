"use client"
import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from "@/components/ui/popover"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Label } from "@/components/ui/label"
import { editUser } from "@/utils/users/editUser"


type UserPopOverProps = {
    user: User
    firstName: string
    lastName: string
    email: string
    roleId: number
    roles: Role[]
    setFirstName: (name: string) => void
    setLastName: (name: string) => void
    setEmail: (name: string) => void
    setRoleId: (roleId: number) => void
    router: any
}

export default function EditRolePopover({ user, firstName, lastName, roleId, email, roles, setFirstName, setLastName, setEmail, setRoleId, router }: UserPopOverProps) {

    async function editUserAndRevalidate(userId: number, firstName: string, lastName: string, email: string) {
        await editUser(userId, firstName, lastName, email, roleId);
        router.refresh();
    }

    return (
        <Popover>
            <PopoverTrigger className="text-blue-400 hover:text-blue-300 transition-all flex items-center">
                Edit
            </PopoverTrigger>
            <PopoverContent className="flex flex-col gap-4">
                <Label className="text-2xl" htmlFor="first_name">First Name</Label>
                <Input type="text" name="first_name" value={firstName} onChange={e => setFirstName(e.target.value)} />
                <Label className="text-2xl" htmlFor="last_name">Last Name</Label>
                <Input type="text" name="last_name" value={lastName} onChange={e => setLastName(e.target.value)} />
                <Label className="text-2xl" htmlFor="email">Email</Label>
                <Input type="text" name="email" value={email} onChange={e => setEmail(e.target.value)} />
                <Label className="text-2xl" htmlFor="role_id">Role</Label>
                <select name="role_id" value={roleId} onChange={e => setRoleId(parseInt(e.target.value))}>
                    <option value={0}>Select a role</option>
                    {roles.map(role => <option key={role.ROLE_ID} value={role.ROLE_ID}>{role.ROLE_NAME}</option>)}
                </select>
                <Button variant="outline" onClick={() => editUserAndRevalidate(user.USER_ID, firstName, lastName, email)}>Confirm</Button>
            </PopoverContent>
        </Popover>
    )
}