import { getTodoList } from "@/utils/todos/getTodoList";
import { getUserById } from "@/utils/users/getUserById";
import { get } from "http";

export default async function TodoListPage({ params }: { params: { userid: string, listid: string } }) {
    const list = await getTodoList(params.listid);
    const user = await getUserById(params.userid);
    const listName = await getTodoList(params.listid);

    return (
        <main className="h-[100dvh]">
            <CreateTodoForm />
            <section className="flex flex-col gap-2 justify-center items-center  text-3xl font-bold p-8">
                {(!list.data.DATA || list.data.DATA.length == 0)
                    ?
                    <p>Could not fetch list</p>
                    :
                    list.data.DATA.map((todo: Todo) => (
                        <div key={todo.TODO_ID}>
                            <p>{todo.TITLE}</p>
                            <p>{todo.DESCRIPTION}</p>
                            <p>{todo.DUE_DATE}</p>
                            <p>{todo.COMPLETED}</p>
                        </div>
                    ))
                }
            </section>
        </main>
    )

}