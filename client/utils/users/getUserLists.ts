import axios from "axios";

export async function getUserLists(userid: string) {
    try {
        return await axios.get(`http://localhost:8500/usertable/server/routes/todolist.cfm?user_id=${userid}`);
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}