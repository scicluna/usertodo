import axios from "axios";

export async function editRole(id: number, name: string) {
    return await axios.put(`http://localhost:8500/usertable/server/routes/role.cfm`, {
        role_id: id,
        role_name: name
    })
}