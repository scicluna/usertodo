import axios from "axios";

export async function deleteUser(userid: number) {
    return await axios.delete(`http://localhost:8500/usertable/server/routes/user.cfm?user_id=${userid}`)
}