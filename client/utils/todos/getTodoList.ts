import axios from "axios";

export async function getTodoList(listId: string) {
    try {
        return await axios.get(`http://localhost:8500/usertable/server/routes/todolist.cfm?list_id=${listId}`);
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}