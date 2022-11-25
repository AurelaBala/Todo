//
//  MarkAsDoneTableViewCell.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 09/11/2022
Simple To Do List App. This version performs only the User Interface of the APP.

The MarkAsDoneTableVewCell is the class for creating a custom cell.
Includes methods for the delegate and perfom actions when a switch changes the state
Version: 1.1.0
*/


//import UIKit
//
////this method will get called when the switch changes the state
//protocol MarkAsDoneTableViewCellDelegate: AnyObject
//{
//    func markAsDoneTableViewCell(_ cell: MarkAsDoneTableViewCell, switchStatus isOn: Bool )
//}
//
//class MarkAsDoneTableViewCell: UITableViewCell {
//    
//    @IBOutlet weak var taskLabel: UILabel!
//    @IBOutlet weak var taskDueDate: UILabel!
//    @IBOutlet weak var taskSwitch: UISwitch!
//    
//    weak var delegate: MarkAsDoneTableViewCellDelegate?
//    
//    //method for changing the color of the due date in UI and delegate the data to the array when the task switch changes
//    @IBAction func completed(_ sender: UISwitch)
//    {
//        updateCompleted()
//        delegate?.markAsDoneTableViewCell(self, switchStatus: taskSwitch.isOn)
//        if(taskSwitch.isOn)
//        {
//            taskDueDate.textColor =  UIColor(hue: 0.49, saturation: 0.41, brightness: 0.65, alpha: 1)
//        }
//        else
//        {
//            taskDueDate.textColor = UIColor(hue: 358, saturation: 0.62, brightness: 0.48, alpha: 1)
//        }
//    }
//    
//    //method for setting the title, due date and the switch
//    func set(title: String, due_date: String, isCompleted: Bool)
//    {
//        taskLabel.text = title
//        taskDueDate.text = due_date
//        taskSwitch.isOn = isCompleted
//        updateCompleted()
//    }
//    
//    //check if the switch is on or off and then add/remove attribute
//    func updateCompleted ()
//    {
//        let attributedString = NSMutableAttributedString(string: taskLabel.text!)
//        if taskSwitch.isOn
//        {
//            attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-1))
//        }
//        else
//        {
//            attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length-1))
//        }
//        taskLabel.attributedText = attributedString
//    }
//}
