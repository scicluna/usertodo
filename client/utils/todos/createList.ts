import axios from "axios";

export async function createList(e: React.FormEvent, userId: number, listName: string) {
    e.preventDefault();
    return axios.post(`http://localhost:8500/usertable/server/routes/todolist.cfm`,
        {
            user_id: userId,
            list_name: listName
        })
}