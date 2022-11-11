//
//  MarkAsDoneTableViewCell.swift
//  Todo
//
//  Created by Aurela Bala on 2022-11-10.
// Custom cell

import UIKit

//this method will get called when the switch changes the statete
protocol MarkAsDoneTableViewCellDelegate: AnyObject
{
    func markAsDoneTableViewCell(_ cell: MarkAsDoneTableViewCell, switchStatus isOn: Bool )
}

class MarkAsDoneTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var taskDueDate: UILabel!
    
    @IBOutlet weak var taskSwitch: UISwitch!
    
    
    weak var delegate: MarkAsDoneTableViewCellDelegate?
    
    @IBAction func completed(_ sender: UISwitch)
    {
        
        updateCompleted()
        delegate?.markAsDoneTableViewCell(self, switchStatus: taskSwitch.isOn)
        if(taskSwitch.isOn)
        {
            taskDueDate.textColor =  UIColor.systemOrange
        }
        else
        {
            taskDueDate.textColor = UIColor.red
        }
        
    }
    
    //method for title, due date and switcher to not be accessed directly
    func set(title: String, due_date: String, isCompleted: Bool)
    {
        taskLabel.text = title
        taskDueDate.text = due_date
        taskSwitch.isOn = isCompleted
        updateCompleted()
    
    }
    
    //check if the switcher is on or off and then add/remove attribute
    func updateCompleted ()
    {
      
        let attributedString = NSMutableAttributedString(string: taskLabel.text!)
        
        if taskSwitch.isOn {
            attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-1))
         
        }
        else {
            attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length-1))
           
           
        }
        taskLabel.attributedText = attributedString
        
        
        
    }
    
}
