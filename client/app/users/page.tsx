import CreateUserForm from "@/components/client/user/CreateUserForm";
import UserItem from "@/components/client/user/UserItem"
import { getRoles } from "@/utils/roles/getRoles";
import { getUsers } from "@/utils/users/getUsers"

export default async function Users() {
    const users = await getUsers();
    const roles = await getRoles();

    console.log(users.data.DATA)

    return (
        <main className="h-[100dvh]">
            <CreateUserForm roles={roles.data.DATA} />
            <section className="flex flex-col gap-2 justify-center items-center  text-3xl font-bold">
                {(!users.data.DATA || users.data.DATA.length == 0)
                    ?
                    <p>Could not fetch users</p>
                    :
                    users.data.DATA.map((user: User) => (
                        <UserItem key={user.USER_ID} user={user} roles={roles.data.DATA} />
                    ))}
            </section>
        </main>
    )
}