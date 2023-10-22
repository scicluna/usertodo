import axios from "axios";

export async function editTodo(todoId: number, title: string, description: string, completed: boolean) {
    try {
        return await axios.put(`http://localhost:8500/usertable/server/routes/todo.cfm?todo_id=${todoId}`,
            {
                todo_id: todoId,
                title: title,
                description: description,
                completed: completed
            });
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}