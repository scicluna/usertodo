import axios from "axios";

export default async function createUser(e: React.FormEvent, firstName: string, lastName: string, email: string, role: string) {
    e.preventDefault();
    try {
        return await axios.post("http://localhost:8500/usertable/server/routes/user.cfm",
            {
                first_name: firstName,
                last_name: lastName,
                email: email,
                role: role
            });
    } catch (error) {
        throw new Error(`Something is wrong, ${error}`)
    }
}