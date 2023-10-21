import axios from "axios";

export async function createRole(e: React.FormEvent, role: string, description: string) {
    e.preventDefault();
    try {
        return await axios.post("http://localhost:8500/usertable/server/routes/role.cfm", { role_name: role, description: description });
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}