import UserItem from "@/components/client/user/UserItem";
import { getRoles } from "@/utils/roles/getRoles";
import { getUsersByRole } from "@/utils/roles/getUsersByRole";

export default async function UsersByRole({ params }: { params: { roleid: number } }) {
    const users = await getUsersByRole(params.roleid);
    const roles = await getRoles();

    return (
        <main className="h-[100dvh]">
            <h1 className="text-center text-5xl underline font-bold">{roles.data.DATA.filter((role: Role) => params.roleid == role.ROLE_ID)[0].ROLE_NAME}</h1>
            <section className="flex flex-col gap-2 justify-center items-center  text-3xl font-bold p-8">
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