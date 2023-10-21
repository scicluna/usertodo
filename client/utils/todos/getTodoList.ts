import axios from "axios";

export async function getTodoList(listid: string) {
    try {
        return await axios.get(`http://localhost:8500/usertable/server/routes/todo.cfm?list_id=${listid}`);
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}