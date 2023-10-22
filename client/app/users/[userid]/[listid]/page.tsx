import CreateTodoForm from "@/components/client/todo/CreateTodoForm";
import TodoItem from "@/components/client/todo/TodoItem";
import { Input } from "@/components/ui/input";
import { getTodoList } from "@/utils/todos/getTodoList";
import { getTodosFromTodoList } from "@/utils/todos/getTodosFromTodoList";
import { getUserById } from "@/utils/users/getUserById";

export default async function TodoListPage({ params }: { params: { userid: string, listid: string } }) {
    const todos = await getTodosFromTodoList(params.listid);
    const user = await getUserById(params.userid);
    const listName = await getTodoList(params.listid);

    return (
        <main className="h-[100dvh]">
            <h1 className="text-center text-5xl underline font-bold">{user.data.DATA[0].FIRST_NAME}'s {listName.data.DATA[0].LIST_NAME}</h1>
            <CreateTodoForm listId={parseInt(params.listid)} />
            <section className="flex flex-col gap-2 justify-center items-center  text-3xl font-bold p-8">
                {(!todos.data.DATA || todos.data.DATA.length == 0)
                    ?
                    <p>Could not fetch todos</p>
                    :
                    todos.data.DATA.map((todo: Todo) => (
                        <TodoItem key={todo.TODO_ID} todo={todo} />
                    ))
                }
            </section>
        </main>
    )

}