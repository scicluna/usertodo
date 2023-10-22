import axios from "axios";

export async function deleteTodo(todoId: number) {
    try {
        return await axios.delete(`http://localhost:8500/usertable/server/routes/todo.cfm?todo_id=${todoId}`);
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}