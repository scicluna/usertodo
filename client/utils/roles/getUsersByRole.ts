import axios from "axios";

export function getUsersByRole(roleId: number) {
    return axios.get(`http://localhost:8500/usertable/server/routes/user.cfm?role_id=${roleId}`)
}