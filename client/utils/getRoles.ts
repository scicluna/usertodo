import axios from "axios";

export async function getRoles() {
    try {
        return await axios.get("http://localhost:8500/usertable/server/routes/role.cfm");
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }

}
