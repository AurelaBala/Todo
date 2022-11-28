//
//  TaskCell.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 23/11/2022
 Simple To Do List App. This version performs not only the User Interface of the APP, but also functionalities such as create a new taks, see all tasks, edit a task and delete a task.
 
 The TaskCell is the class for creating a custom cell.
 Includes methods and perfom actions when a switch changes the state.
Version: 1.2.0
*/

import UIKit
import SwiftUI


class TaskCell: UITableViewCell
{

    //for each item in task item set the data
    
    var taskItem: TaskItem?
    {
        
        didSet
        {
            
            taskTitle.text = taskItem?.name
            TASK_ID.text = taskItem?.taskID
            let attributedString = NSMutableAttributedString(string: taskTitle.text!)
        
            //if task is completed then switch that on
            if let isCompleted = taskItem?.isCompleted, isCompleted
            {
                switchControl.isOn = true
                taskDueDate.textColor = UIColor(hue: 0.49, saturation: 0.41, brightness: 0.65, alpha: 1)
                attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-0))
            }
            else
            {
                switchControl.isOn = false
            }
            taskTitle.attributedText = attributedString
            //if task is completed then switch that off
            if let hasDueDate = taskItem?.hasDueDate, hasDueDate
            {
                taskDueDate.text = taskItem?.dueDate
            }
            else
            {
                taskDueDate.text = "Has no due date"
            }
        }
    }
    
    var TASK_ID: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = UIColor(hue: 0.783, saturation: 0.24, brightness: 0.33, alpha: 1)
        label.text = "Task id"
        label.isHidden = true
        return label
    }()
    
   //create the custom task tile label
    private let taskTitle: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = UIColor(hue: 0.783, saturation: 0.24, brightness: 0.33, alpha: 1)
       // label.textColor = .black
        label.text = "Task Name"
        return label
    }()
    
    //create the custom task due date label
    private let taskDueDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIColor(hue: 358, saturation: 0.62, brightness: 0.48, alpha: 1)
        label.text = "Due Date"
        return label
    }()
    
    //create the custom task switch control
    private let switchControl: UISwitch = {
        let switch_control = UISwitch()
        switch_control.isOn = false
        switch_control.isEnabled = true
        switch_control.onTintColor = UIColor(hue: 0.49, saturation: 0.41, brightness: 0.65, alpha: 1)
        switch_control.translatesAutoresizingMaskIntoConstraints = false
        switch_control.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        return switch_control
    }()
    
    //create the custom task edit button
     let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.tintColor = UIColor(hue: 0.65, saturation: 0.57, brightness: 0.92, alpha: 1)
        button.scalesLargeContentImage = true
        button.imageView?.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.1)
        button.addTarget(self, action: #selector(getTaskID), for: .touchUpInside)
        return button
    }()
    
    //add the custom elements to the cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(TASK_ID)
        TASK_ID.anchor(top: topAnchor, left: leftAnchor, paddingTop: 7, paddingLeft: 20)
        //add task title and the position for it
        addSubview(taskTitle)
        taskTitle.anchor(top: topAnchor, left: leftAnchor, paddingTop: 7, paddingLeft: 20)
        //add task due date and the position for it
        addSubview(taskDueDate)
        taskDueDate.anchor(top: taskTitle.bottomAnchor, left: leftAnchor, paddingTop: 1, paddingLeft: 20)
        //add task switch control and the position for it
        addSubview(switchControl)
     switchControl.anchor(top: topAnchor, right: rightAnchor,  paddingTop: 7, paddingRight: 55)
        //add task edit button and the position for it
        addSubview(editButton)
     editButton.anchor(top: topAnchor, right: rightAnchor,  paddingTop: 10, paddingRight: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder has not been implemented")
    }
    
    
    //method for checking the switch action and perform certain actions when the switch is turned on or off
    @objc func handleSwitchAction(sender: UISwitch) 
    {
        let attributedString = NSMutableAttributedString(string: taskTitle.text!)
        print(attributedString)
           
           if sender.isOn
        {
               taskDueDate.textColor = UIColor(hue: 0.49, saturation: 0.41, brightness: 0.65, alpha: 1)
               UIApplication.shared.registerForRemoteNotifications()
               attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-0))
        }
        else
        {
            UIApplication.shared.unregisterForRemoteNotifications()
            taskDueDate.textColor = UIColor(hue: 358, saturation: 0.62, brightness: 0.48, alpha: 1)
            attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length-2))

        }
        
        taskTitle.attributedText = attributedString
    
        //when the switch changes its state, change that on Firebase too
        let id = taskItem?.taskID
        let name = taskItem?.name
        let notes = taskItem?.notes
        let hasDueDate = taskItem?.hasDueDate.self
        let dueDate = taskItem?.dueDate
        
        PostService.shared.updateAllDetails(taskID: id!, isCompleted:
        sender.isOn, name: name!, notes: notes!, hasDueDate: hasDueDate!, dueDate: dueDate!) {(error, reference) in
        }
        
       }
    
    //on edit button click, set the task id on the Edit Task View Controller getID method
    @objc func getTaskID (sender: UIButton)
    {
        let vc = EditTaskViewController()
        let attributedString = NSMutableAttributedString(string: TASK_ID.text!)
        TASK_ID.attributedText = attributedString
        let id = TASK_ID.attributedText?.string
        vc.getID(a: id!)
       
    }
    

}

