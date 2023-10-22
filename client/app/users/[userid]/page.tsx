import CreateListForm from "@/components/client/list/CreateListForm";
import { getUserById } from "@/utils/users/getUserById";
import { getUserLists } from "@/utils/users/getUserLists";
import Link from "next/link";

export default async function UserPage({ params }: { params: { userid: string } }) {
    const lists = await getUserLists(params.userid);
    const user = await getUserById(params.userid);

    return (
        <main className="h-[100dvh]">
            <h1 className="text-center text-5xl underline font-bold">{user.data.DATA[0].FIRST_NAME}'s Lists</h1>
            <CreateListForm userId={parseInt(params.userid)} />
            <section className="flex flex-col gap-2 justify-center items-center  text-3xl font-bold p-8">
                {(!lists.data.DATA || lists.data.DATA.length == 0)
                    ?
                    <p>Could not fetch lists</p>
                    :
                    lists.data.DATA.map((list: TodoList) => (
                        <Link key={list.LIST_ID} className="hover:animate-pulse font-bold text-4xl" href={`/users/${params.userid}/${list.LIST_ID}`}>{list.LIST_NAME}</Link>
                    ))}
            </section>
        </main>
    )
}