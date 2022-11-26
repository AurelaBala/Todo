//
//  TaskViewController.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 23/11/2022
 Simple To Do List App. This version performs not only the User Interface of the APP, but also functionalities such as create a new taks, see all tasks and edit a task.

The TaskViewController is the create a new Task screen that includes the task title and a method for adding the new task into the Firebase Database
Screen performs in both modes: portrait and landscape
Version: 1.2.0
*/

import UIKit



class TaskViewController: UIViewController {
    
    @IBOutlet weak var newTaskTitle: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        newTaskTitle.delegate = self
    }
    
//method for save button pressed
    @IBAction func saveNewTask(_ sender: UIButton)
    {
        print(newTaskTitle.text)
    }
}

//newTaskTitle delegate (dissmis the keyboard when the return is pressed)
extension TaskViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
