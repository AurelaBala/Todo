//
//  PostService.swift
//  Todo
//
//  Created by Aurela Bala on 2022-11-25.
//

import UIKit
import Firebase

struct TaskItem
{
    var name: String
    var isCompleted: Bool
    var notes: String
    var hasDueDate: Bool
    var dueDate: String
    
    init(keyID: String, dictionary: [String: Any])
    {
        self.name = dictionary["name"] as? String ?? ""
        self.isCompleted = dictionary["isCompleted"] as? Bool ?? false
        self.notes = dictionary["notes"] as? String ?? ""
        self.hasDueDate = dictionary["hasDueDate"] as? Bool ?? false
        self.dueDate = dictionary["dueDate"] as? String ?? ""

    }
}

struct PostService
{
    //create a shared property
    static let shared = PostService()
    let DB_REFERENCE = Database.database().reference()
    
    func fetchAllTasks()
    {
        DB_REFERENCE.child("tasks").observe(.childAdded)
        {
            (snapshot) in fetchOneTask(id: snapshot.key)
        }
    }
    
    func fetchOneTask(id: String)
    {
        DB_REFERENCE.child("tasks").child(id).observeSingleEvent(of: .value)
        {
            (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else
            { return }
            let task = TaskItem(keyID: id, dictionary: dictionary)
            print (task)
        }
    }
}
