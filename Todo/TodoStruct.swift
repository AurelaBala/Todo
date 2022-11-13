//
//  TodoStruct.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 09/11/2022
Simple To Do List App. This version performs only the User Interface of the APP.

The To Do struct stores the data about each to do item
Version: 1.1.0
*/


import Foundation

//ToDoList struct
struct TodoList
{
    let title: String
    let due_date: String
    let isCompleted: Bool
    
    //replace the constant struct todo value with the new todo
    init(title: String, due_date: String, isCompleted: Bool = false)
    {
        self.title = title
        self.due_date = due_date
        self.isCompleted = isCompleted
    }
}
