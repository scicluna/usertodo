import { getUsers } from "@/utils/users/getUsers"
import Link from "next/link"

export default async function Users() {
    const users = await getUsers()

    if (!users.data.DATA || users.data.DATA.length == 0) {
        return (
            <main>
                <p>Could not fetch users</p>
            </main>
        )
    }

    return (
        <main className="h-[100dvh]">
            {(users.data.DATA || users.data.Data.length == 0)
                ?
                <p>Could not fetch users</p>
                :
                users.data.DATA.map((user: User) => {
                    <Link href={`/users/${user.user_id}`}>{user.first_name} {user.last_name}</Link>
                })}
        </main>
    )
}