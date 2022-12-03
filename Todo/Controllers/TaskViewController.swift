//
//  TaskViewController.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 01/12/2022
 Simple To Do List App. This version performs not only the User Interface of the APP, but also functionalities such as create a new taks, see all tasks, edit a task and delete a task.

The TaskViewController is the create a new Task screen that includes the task title and a method for adding the new task into the Firebase Database
Screen performs in both modes: portrait and landscape
Version: 1.3.0
*/

import UIKit



class TaskViewController: UIViewController {
    
    @IBOutlet weak var newTaskTitle: UITextField!
    
    @IBOutlet weak var taskView: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.taskView.layer.cornerRadius = 10.0
        newTaskTitle.layer.cornerRadius = 10.0
        newTaskTitle.layer.borderWidth = 1
        newTaskTitle.layer.borderColor = UIColor(hue: 0.65, saturation: 0.57, brightness: 0.92, alpha: 1).cgColor
        
        newTaskTitle.delegate = self
    }
    
//method for save button pressed
    @IBAction func saveNewTask(_ sender: UIButton)
    {
        guard let  taskName = newTaskTitle.text else { return }
        //call the shared property and upload the new task with the textfield value
        if(newTaskTitle.text != "" ) {
            PostService.shared.insertNewTask(name: taskName)
            {
                (error, reference) in
                self.newTaskTitle.text = ""
                self.dismiss(animated: true, completion: nil)
            }
            self.performSegue(withIdentifier: "goBack", sender: self) }
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
