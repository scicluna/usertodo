import axios from "axios";

export async function getUserById(userId: string) {
    try {
        return await axios.get(`http://localhost:8500/usertable/server/routes/user.cfm?user_id=${userId}`);
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}