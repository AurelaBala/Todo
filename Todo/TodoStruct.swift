//
//  TodoStruct.swift
//  Todo
//
//  Created by Aurela Bala on 2022-11-10.
// Store the data about each to do item

import Foundation

struct TodoList
{
    let title: String
    let due_date: String
    //let description: String
    let isCompleted: Bool
    
    init(title: String, due_date: String, isCompleted: Bool = false) {
        self.title = title
        self.due_date = due_date
        self.isCompleted = isCompleted
    }
}
