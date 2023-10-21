import { getTodoList } from "@/utils/todos/getTodoList";

export default async function TodoListPage(params: { userid: string, listid: string }) {
    const list = await getTodoList(params.listid);

    //eventually convert todolist to a client component
    return (
        <main className="h-[100dvh]">
            {(list.data.DATA || list.data.Data.length == 0)
                ?
                <p>Could not fetch list</p>
                :
                list.data.DATA.map((todo: Todo) => (
                    <div key={todo.todo_id}>
                        <p>{todo.title}</p>
                        <p>{todo.description}</p>
                        <p>{todo.due_date}</p>
                        <p>{todo.completed}</p>
                    </div>
                ))
            }
        </main>
    )

}