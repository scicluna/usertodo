import { getRoles } from "@/utils/roles/getRoles";
import Link from "next/link";


export default async function Roles() {
    const roles = await getRoles()

    return (
        <main className="h-[100dvh]">
            {(roles.data.DATA || roles.data.Data.length == 0)
                ?
                <p>Could not fetch roles</p>
                :
                roles.data.DATA.map((role: Role) => {
                    <Link href={`/users/${role.role_id}`}>{role.role_name}</Link>
                })}
        </main>
    )
}