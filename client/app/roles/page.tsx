import CreateRoleForm from "@/components/client/role/CreateRoleForm";
import RoleItem from "@/components/client/role/RoleItem";
import { getRoles } from "@/utils/roles/getRoles";

export default async function Roles() {
    const roles = await getRoles()

    return (
        <main className="h-[100dvh]">
            <CreateRoleForm />
            <section className="flex flex-col gap-2 justify-center items-center  text-3xl font-bold">
                {(!roles.data.DATA || roles.data.DATA.length == 0)
                    ?
                    <p>Could not fetch roles</p>
                    :
                    roles.data.DATA.map((role: Role) => (
                        <RoleItem key={role.ROLE_ID} role={role} />
                    ))}
            </section>
        </main>
    )
}