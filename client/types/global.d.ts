type Role = {
    ROLE_ID: number;
    ROLE_NAME: string;
    DESCRIPTIONS?: string; // Since it's not marked as "required" in the CF component, it's made optional here
    USERS: User[]; // Assuming there's a corresponding 'User' type defined somewhere
};

type User = {
    USER_ID: number;
    FIRST_NAME: string;
    LAST_NAME: string;
    EMAIL: string;
    ROLE: number;  // This is a numeric representation (ID) of the role associated with the user
    TODOLISTS: TodoList[];
    getFullName: () => string;  // This function returns the full name of the user
};

type TodoList = {
    list_id: number;
    list_name: string;
    user: number;  // This is a numeric representation (ID) of the user associated with the todo list
    todos: Todo[];
};

type Todo = {
    todo_id: number;
    title: string;
    description?: string;  // Since it's not marked as "required" in the CF component, it's made optional here
    due_date: string;
    completed: boolean;
    list: number;  // This is a numeric representation (ID) of the todo list associated with the todo
};