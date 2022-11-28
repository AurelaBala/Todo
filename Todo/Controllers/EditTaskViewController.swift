//
//  EditTaskViewController.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 23/11/2022
 Simple To Do List App. This version performs not only the User Interface of the APP, but also functionalities such as create a new taks, see all tasks, edit a task and delete a task.

The EditTaskViewController is the Edit Task Details screen that includes all the task details ( title, description, due date, switch controller and buttons to edit, delete and cancel the actions). Perform several methods: edit, delete and discard.
Screen performs in both modes: portrait and landscape
Version: 1.2.0
*/


import UIKit
import SwiftUI


class EditTaskViewController: UIViewController {
    
   
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var editTaskView: UIView!
    @IBOutlet weak var editTitleLandscape: UITextField!
    @IBOutlet weak var taskDescriptionLandscape: UITextView!
    @IBOutlet weak var hasDueDatePortrait: UISwitch!
    @IBOutlet weak var isCompletedPortrait: UISwitch!
    @IBOutlet weak var hasDueDateLandscape: UISwitch!
    @IBOutlet weak var dueDatePortrait: UIDatePicker!
    @IBOutlet weak var isCompletedLandscape: UISwitch!
    @IBOutlet weak var dueDateLandscape: UIDatePicker!
    
    var task: TaskItem?
    static var b = ""
    
    //get id method
    public func getID(a: String)
    {
        EditTaskViewController.b = a
        print(EditTaskViewController.b)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //custom design for the portrait mode elements
        self.editView.layer.cornerRadius = 10.0
        editTaskView.layer.cornerRadius = 10.0
        editTitle.layer.cornerRadius = 10
        taskDescription.layer.cornerRadius = 10
        editTitle.layer.borderWidth = 1
        taskDescription.layer.borderWidth = 1
        editTitle.layer.borderColor = UIColor(hue: 0.65, saturation: 0.57, brightness: 0.92, alpha: 1).cgColor
        taskDescription.layer.borderColor = UIColor(hue: 0.65, saturation: 0.57, brightness: 0.92, alpha: 1).cgColor
        //custom design for the landscape mode elements
        editTitleLandscape.layer.cornerRadius = 10
        taskDescriptionLandscape.layer.cornerRadius = 10
        editTitleLandscape.layer.borderWidth = 1
        taskDescriptionLandscape.layer.borderWidth = 1
        editTitleLandscape.layer.borderColor = UIColor(hue: 0.65, saturation: 0.57, brightness: 0.92, alpha: 1).cgColor
        taskDescriptionLandscape.layer.borderColor = UIColor(hue: 0.65, saturation: 0.57, brightness: 0.92, alpha: 1).cgColor
        dueDatePortrait.minimumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
    
        //get the task details
        PostService.shared.fetchOneTask(id: EditTaskViewController.b) { [self] TaskItem in
                dueDatePortrait.isEnabled = false
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "YYYY-MM-dd, hh:mm:ss a"
                let dateTxt = dateFormatter.date(from: TaskItem.dueDate)
                //portrait mode
                self.editTitle.text = TaskItem.name
                self.taskDescription.text = TaskItem.notes
                self.isCompletedPortrait.isOn = TaskItem.isCompleted
                self.hasDueDatePortrait.isOn = TaskItem.hasDueDate
                //landscape mode
                self.editTitleLandscape.text = editTitle.text
                self.taskDescriptionLandscape.text = taskDescription.text
                isCompletedLandscape.isOn = isCompletedPortrait.isOn
                hasDueDateLandscape.isOn = hasDueDatePortrait.isOn
            
            
                if(TaskItem.dueDate != "")
                {
                self.dueDatePortrait.date = dateTxt!
                self.dueDateLandscape.date = dueDatePortrait.date
                }
                
                if(hasDueDatePortrait.isOn)
                {
                    dueDatePortrait.isEnabled = true
                    dueDateLandscape.isEnabled = true
                }
                hasDueDatePortrait.addTarget(self, action: #selector(displayDatePicker), for: .valueChanged)
                hasDueDateLandscape.addTarget(self, action: #selector(displayDatePicker), for: .valueChanged)
        }
    }
    
    
    //passing the same value in both modes for task name when one of the changes
    @IBAction func taskTitle(_ sender: UITextField) {
        editTitle.text = sender.text
        editTitleLandscape.text = editTitle.text
    }
    
    //method for makeing the date picker enabeled/disabled
    @objc func displayDatePicker(sender: UISwitch) {
        if sender.isOn
        {
            dueDatePortrait.isEnabled = true
            dueDateLandscape.isEnabled = true
        }
        else
        {
            dueDatePortrait.isEnabled = false
            dueDateLandscape.isEnabled = false
        }
    }
    //pass the same value in both due date if one of them changes
    @IBAction func dateChanged (_ sender: UIDatePicker)
    {
        dueDatePortrait.date = sender.date
        dueDateLandscape.date = dueDatePortrait.date
    }
    //method for save button click
    @IBAction func saveNewDetails(_ sender: UIButton)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd, hh:mm:ss a"
        let dateTxt = dateFormatter.string(from: dueDatePortrait.date)
        // Create Alert
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to update this task?", preferredStyle: .alert)
        // Create yes button with action handler, if yes is pressed then perform the changes into database
        let ok = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            PostService.shared.updateAllDetails(taskID: EditTaskViewController.b, isCompleted: self.isCompletedPortrait.isOn, name: self.editTitle.text!, notes: self.taskDescription.text!, hasDueDate: self.hasDueDatePortrait.isOn, dueDate: dateTxt) {(error, reference) in
                self.performSegue(withIdentifier: "goBack", sender: self)
                    }
        })
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        //Add OK and Cancel button to an Alert object
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        // Present alert message to user
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    //method for discard button clicked
    @IBAction func discardButton(_ sender: UIButton)
    {
        //check if the user have done any changes, if yes display the alert box
        if(((editTitle.text != editTitleLandscape.text)) || ((taskDescription.text != taskDescriptionLandscape.text)) || ((hasDueDatePortrait.isOn != hasDueDateLandscape.isOn)) || ((isCompletedPortrait.isOn != isCompletedLandscape.isOn)) || ((dueDatePortrait.date != dueDateLandscape.date)))
        {
            // Create Alert
            let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to discard the changes?", preferredStyle: .alert)
            // Create Yes button with action handler, is yes pressed then go to the list of todos
            let ok = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            self.performSegue(withIdentifier: "goBack", sender: self)
            })
            // Create Cancel button with action handlder
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                print("Cancel button tapped")
            }
            //Add OK and Cancel button to an Alert object
            dialogMessage.addAction(ok)
            dialogMessage.addAction(cancel)
            // Present alert message to user
            self.present(dialogMessage, animated: true, completion: nil)
        }
        //if not, go back to the list of todos
        else
        {
            self.performSegue(withIdentifier: "goBack", sender: self)
        }
        
    }
    
    //method on click of a delete Task
    @IBAction func deleteTask(_ sender: UIButton)
    {
        // Create Alert
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this task?", preferredStyle: .alert)
        // Create Yes button with action handler, if yes then delete the task from database
        let ok = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            self.performSegue(withIdentifier: "goBack", sender: self)
            PostService.shared.deleteTask(taskID: EditTaskViewController.b) {(error, reference) in
                        print("done")
                self.performSegue(withIdentifier: "goBack", sender: self)
                let vc = ViewController()
                vc.fetchAllTasks()
                    }
        })
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        //Add OK and Cancel button to an Alert object
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        // Present alert message to user
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
