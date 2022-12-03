//
//  TaskCell.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 01/12/2022
 Simple To Do List App. This version performs not only the User Interface of the APP, but also functionalities such as create a new taks, see all tasks, edit a task and delete a task.
 
 The TaskCell is the class for creating a custom cell.
 Includes methods and perfom actions when a switch changes the state.
Version: 1.3.0
*/

import UIKit
import SwiftUI


class TaskCell: UITableViewCell
{

    //for each item in task item set the data
    static var hey = ""
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
                noteCompleted.text = " | completed"
                
            }
            else
            {
                noteCompleted.text = " | uncompleted"
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
            
            if(noteCompleted.text == " | completed")
            {
                taskDueDate.textColor = UIColor(hue: 0.49, saturation: 0.41, brightness: 0.65, alpha: 1)
                taskTitle.textColor = UIColor(hue: 0.49, saturation: 0.41, brightness: 0.65, alpha: 1)
              
            }
            
            else
            {
                taskDueDate.textColor = UIColor(hue: 358, saturation: 0.62, brightness: 0.48, alpha: 1)
                taskTitle.textColor = UIColor(hue: 0.783, saturation: 0.24, brightness: 0.33, alpha: 1)
                
            }
            
        }
    
        
    }
    

   
    
    var TASK_ID: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = UIColor(hue: 0.783, saturation: 0.24, brightness: 0.33, alpha: 1)
        label.text = TaskCell.hey
        label.isHidden = true
        return label
    }()
    
   //create the custom task tile label
    let taskTitle: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = UIColor(hue: 0.783, saturation: 0.24, brightness: 0.33, alpha: 1)
       // label.textColor = .black
        label.text = "Task Name"
        return label
    }()
    
    //create the custom task tile label
     var noteCompleted: UILabel = {
         let label = UILabel()
         label.font = .boldSystemFont(ofSize: 12)
         label.textColor = UIColor(hue: 0.783, saturation: 0.24, brightness: 0.33, alpha: 1)
        // label.textColor = .black
         label.text = "|"
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
        //add task completed or not label and the position for it
      addSubview(noteCompleted)
        noteCompleted.anchor(top: taskTitle.bottomAnchor, left: taskDueDate.rightAnchor,  paddingTop: 1, paddingLeft: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder has not been implemented")
    }
    

//    @objc func deleteOnSwipe(sender: UITableViewCell)
//    {
//        let vc = ViewController()
//        let attributedString = NSMutableAttributedString(string: TASK_ID.text!)
//        print("Atr is:"+attributedString.string)
//        TASK_ID.attributedText = attributedString
//        let id = TASK_ID.attributedText?.string
//        vc.getID(id: id!)
//        print(id!)
//    }
    
}

