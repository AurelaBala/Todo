//
//  PostService.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 23/11/2022
 Simple To Do List App. This version performs not only the User Interface of the APP, but also functionalities such as create a new taks, see all tasks, edit a task and delete a task.

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
    var taskID: String
    //init method
    init(keyID: String, dictionary: [String: Any])
    {
        self.name = dictionary["name"] as? String ?? ""
        self.isCompleted = dictionary["isCompleted"] as? Bool ?? false
        self.notes = dictionary["notes"] as? String ?? ""
        self.hasDueDate = dictionary["hasDueDate"] as? Bool ?? false
        self.dueDate = dictionary["dueDate"] as? String ?? ""
        self.taskID = dictionary["taskID"] as? String ?? ""
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
    
    //insert a new task into the firebase database through TaskViewController
    func insertNewTask(name: String,  completion: @escaping(Error?, DatabaseReference) -> Void)
    {
        //create the array
        let data =
        [
            "name": name,
            "isCompleted": false,
            "notes": "",
            "hasDueDate": false,
            "dueDate": ""
        ] as [String: Any]
        //generate an id for the new entry task
        let taskID = DB_REFERENCE.child("tasks").childByAutoId()
        taskID.updateChildValues(data, withCompletionBlock: completion)
        taskID.updateChildValues(data) {(error, reference)
            in
            let id = ["taskID": taskID.key!]
            //upload the new task
            DB_REFERENCE.child("tasks").child(taskID.key!).updateChildValues(id, withCompletionBlock: completion)
            
        }
    
    }
    
   //update task details method
    func updateAllDetails(taskID: String, isCompleted: Bool, name: String, notes: String, hasDueDate: Bool, dueDate: String, completion: @escaping(Error?, DatabaseReference) -> Void)
    {
        let data = [
         "isCompleted": isCompleted,
        "name": name,
         "notes": notes,
         "hasDueDate": hasDueDate,
         "dueDate": dueDate
        ] as [String : Any]
        DB_REFERENCE.child("tasks").child(taskID).updateChildValues(data, withCompletionBlock: completion)
    }
    
    //delete a task method
    func deleteTask(taskID: String, completion: @escaping(Error?, DatabaseReference) -> Void)
     {
         DB_REFERENCE.child("tasks").child(taskID).removeValue()
            
     }
    
    
}
