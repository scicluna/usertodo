import { getUserLists } from "@/utils/users/getUserLists";
import Link from "next/link";

export default async function UserPage({ params }: { params: { userid: string } }) {
    const lists = await getUserLists(params.userid);

    return (
        <main className="h-[100dvh]">
            {(lists.data.DATA || lists.data.Data.length == 0)
                ?
                <p>Could not fetch lists</p>
                :
                lists.data.DATA.map((list: TodoList) => {
                    <Link href={`/users/${params.userid}/${list.list_id}`}>{list.list_name}</Link>
                })}
        </main>
    )
}