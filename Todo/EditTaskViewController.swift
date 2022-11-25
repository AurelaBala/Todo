//
//  EditTaskViewController.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 09/11/2022
Simple To Do List App. This version performs only the User Interface of the APP.

The EditTaskViewController is the Edit Task Details screen that includes all the task details ( title, description, due date, switch controller and buttons to edit, delete and cancel the actions).
Screen performs in both modes: portrait and landscape
Version: 1.1.0
*/


import UIKit
import SwiftUI

//protocol EditTaskViewControllerDelegate: AnyObject {
//    func EditTaskViewController (_ vc: EditTaskViewController, saveTask task: TodoList)
//}

class EditTaskViewController: UIViewController {

   
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var editTaskView: UIView!
    @IBOutlet weak var editTitleLandscape: UITextField!
    @IBOutlet weak var taskDescriptionLandscape: UITextView!
    
    var task: TodoList?
    //var task2 = ""
    
    //weak var delegate: EditTaskViewControllerDelegate?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        editTitle.text = task?.title
        taskDescription.text = task?.description
        
        //custom design for the portrair mode elements
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
    }
    
    
//    @IBAction func addTask(_ sender: Any) {
//        let task = TodoList(title: editTitle.text!, due_date: "", description: "")
//        delegate?.EditTaskViewController(self, saveTask: task)
//    }
}
