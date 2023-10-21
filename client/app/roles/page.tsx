import CreateRoleForm from "@/components/client/CreateRoleForm";
import { getRoles } from "@/utils/roles/getRoles";
import Link from "next/link";

//add optimistic updates?
export default async function Roles() {
    const roles = await getRoles()

    return (
        <main className="h-[100dvh]">
            <CreateRoleForm />
            <section className="flex flex-col gap-2">
                {(!roles.data.DATA || roles.data.DATA.length == 0)
                    ?
                    <p>Could not fetch roles</p>
                    :
                    roles.data.DATA.map((role: Role) => (
                        <Link href={`/roles/${role.ROLE_ID}`}>{role.ROLE_NAME}</Link>
                    ))}
            </section>
        </main>
    )
}