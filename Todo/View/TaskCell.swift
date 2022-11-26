//
//  TaskCell.swift
//  Todo
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 23/11/2022
 Simple To Do List App. This version performs not only the User Interface of the APP, but also functionalities such as create a new taks, see all tasks and edit a task.
 
 The TaskCell is the class for creating a custom cell.
 Includes methods and perfom actions when a switch changes the state.
Version: 1.2.0
*/

import UIKit


class TaskCell: UITableViewCell
{
   //create the custom task tile label
    private let taskTitle: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = UIColor(hue: 0.783, saturation: 0.24, brightness: 0.33, alpha: 1)
       // label.textColor = .black
        label.text = "Holaaaa"
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
    private let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.tintColor = UIColor(hue: 0.65, saturation: 0.57, brightness: 0.92, alpha: 1)
        button.scalesLargeContentImage = true
        button.imageView?.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.1)
        return button
    }()

    //add the custom elements to the cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
           
           if sender.isOn
        {
               print("Turned on")
               taskDueDate.textColor = UIColor(hue: 0.49, saturation: 0.41, brightness: 0.65, alpha: 1)
               UIApplication.shared.registerForRemoteNotifications()
               attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-1))
        }
        else
        {
            UIApplication.shared.unregisterForRemoteNotifications()
            print("Turned off")
            taskDueDate.textColor = UIColor(hue: 358, saturation: 0.62, brightness: 0.48, alpha: 1)
            attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length-2))

        }
        taskTitle.attributedText = attributedString
       }
}

