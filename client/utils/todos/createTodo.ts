import axios from "axios";

export async function createTodo(e: React.FormEvent, listId: number, title: string, description: string, completed: boolean) {
    e.preventDefault();
    try {
        return await axios.post(`http://localhost:8500/usertable/server/routes/todo.cfm`,
            {
                list_id: listId,
                title: title,
                description: description,
                completed: completed
            });
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}