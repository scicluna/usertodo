import axios from "axios";

export async function deleteRole(id: number) {
    return await axios.delete(`http://localhost:8500/usertable/server/routes/role.cfm?role_id=${id}`)
}