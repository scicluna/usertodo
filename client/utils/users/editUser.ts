import axios from "axios";

export async function editUser(userId: number, firstName: string, lastName: string, email: string, roleId: number) {
    return await axios.put(`http://localhost:8500/usertable/server/routes/user.cfm`, {
        user_id: userId,
        first_name: firstName,
        last_name: lastName,
        email: email,
        role_id: roleId
    })
}