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
    LIST_ID: number;
    LIST_NAME: string;
    USER: number;  // This is a numeric representation (ID) of the user associated with the todo list
    TODOS: Todo[];
};

type Todo = {
    TODO_ID: number;
    TITLE: string;
    DESCRIPTION?: string;  // Since it's not marked as "required" in the CF component, it's made optional here
    DUE_DATE: string;
    COMPLETED: boolean;
    LIST: number;  // This is a numeric representation (ID) of the todo list associated with the todo
};