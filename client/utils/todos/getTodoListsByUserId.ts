import axios from "axios";

export async function getTodoListsByUserId(userId: number) {
    try {
        return await axios.get(`http://localhost:8500/usertable/server/routes/todolist.cfm?user_id=${userId}`);
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}