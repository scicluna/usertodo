import axios from "axios";

export async function getUsers() {
    try {
        return await axios.get("http://localhost:8500/usertable/server/routes/user.cfm");
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}