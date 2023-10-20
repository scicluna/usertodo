import { getRoles } from "@/utils/getRoles";
import Link from "next/link";


export default async function Roles() {
    const roles = await getRoles()

    if (!roles.data.DATA) {
        return (
            <main>
                <p>Could not fetch Roles</p>
            </main>
        )
    }

    return (
        <main className="h-[100dvh]">
            {roles.data.DATA.map((role: Role) => {
                <Link href={`/roles/${role.role_id}`}>{role.role_name}</Link>
            })}
        </main>
    )
}