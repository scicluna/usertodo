import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from "@/components/ui/popover"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { editRole } from "@/utils/roles/editRole"


type RolePopoverProps = {
    role: Role
    name: string
    setName: (name: string) => void
    router: any
}

export default function EditRolePopover({ role, name, setName, router }: RolePopoverProps) {

    async function editRoleAndRevalidate(roleId: number, roleName: string) {
        await editRole(roleId, roleName);
        router.refresh();
    }

    return (
        <Popover>
            <PopoverTrigger className="text-blue-400 hover:text-blue-300 transition-all">Edit</PopoverTrigger>
            <PopoverContent className="flex flex-col gap-4">
                <Input type="text" value={name} onChange={e => setName(e.target.value)} />
                <Button variant="outline" onClick={() => editRoleAndRevalidate(role.ROLE_ID, name)}>Confirm</Button>
            </PopoverContent>
        </Popover>
    )
}