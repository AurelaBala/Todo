//
//  PostService.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 23/11/2022
 Simple To Do List App. This version performs not only the User Interface of the APP, but also functionalities such as create a new taks, see all tasks and edit a task.

 Through PostService we can fetch all the tasks that are stored in the Firebase and display them on the TableView cell
 Screen performs in both modes: portrait and landscape
 Version: 1.2.0
 */

import UIKit
import Firebase

//task struct
struct TaskItem
{
    var name: String
    var isCompleted: Bool
    var notes: String
    var hasDueDate: Bool
    var dueDate: String
    
    //init method
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
    
    //fetch all the tasks
    func fetchAllTasks(completion: @escaping([TaskItem]) -> Void)
    {
        var allTasks = [TaskItem]()
        DB_REFERENCE.child("tasks").observe(.childAdded)
        {
            (snapshot) in
            //fetchOneTask(id: snapshot.key)
            fetchOneTask(id: snapshot.key) { task in
                allTasks.append(task)
                completion(allTasks)
                
            }
        }
    }
    
    //create the task object for each task items in firebase
    func fetchOneTask(id: String, completion: @escaping(TaskItem) -> Void )
    {
        DB_REFERENCE.child("tasks").child(id).observeSingleEvent(of: .value)
        {
            (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else
            { return }
            let task = TaskItem(keyID: id, dictionary: dictionary)
            completion(task)
        }
    }
}
