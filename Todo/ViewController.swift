//
//  ViewController.swift
//  Todo
//
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 09/11/2022
Simple To Do List App. This version performs only the User Interface of the APP.

The View Controller is the Todo List Screen that includes the list of all of the tasks and for each item includes a title, a due date, a switch control and an edit button.
Includes a table view which is populated from an array.
Screen performs in both modes: portrait and landscape
Version: 1.2.0
*/

import UIKit
import SwiftUI


class ViewController: UIViewController
{
    //an array with several tasks
//    var todotasks =
//    [
//    TodoList(title: "Task 1", due_date: "25 November 2022", description: "This is a note for task 1"),
//    TodoList(title: "Task 2", due_date: "30 November 2022", description: "This is a note for task 2"),
//    TodoList(title: "Task 3", due_date: "1 December 2022", description: "This is a note for task 3"),
//    TodoList(title: "Task 4", due_date: "25 November 2022", description: "This is a note for task 4")
//    ]
    //var todotasks = [String]()

    @IBOutlet weak var tableView: UITableView!
   // @IBOutlet weak var addTaskButton: UIButton!
   
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //custom design for add task button and corner radius for the tableview
//        addTaskButton.layer.shadowColor = UIColor.white.cgColor
//        addTaskButton.layer.shadowOffset = CGSize(width: 1, height: 1)
//        addTaskButton.layer.shadowRadius = 5
//        addTaskButton.layer.shadowOpacity = 0.8
//        self.tableView.layer.cornerRadius = 10.0
        //tableView.backgroundColor = .green
       
    }
    
    //unwind segue
    @IBAction func goBack(segue: UIStoryboardSegue)
    {
    }
    
    
    
    
//    @IBAction func editTaskBttn(_ sender: UIButton)
//    {
//        let sendValue = EditTaskViewController();
//
//         let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tableView)
//          if  let indexPath = self.tableView.indexPathForRow(at: buttonPosition) {
//            let task = todotasks[indexPath.row]
//
//            sendValue.task = task
//
//            print(task)
//
//        }
//
//    }
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)   {
//        if segue.identifier == "edit" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let controller = segue.destination as! EditTaskViewController
//                let task = todotasks[indexPath.row]
//                //controller.task = task
//                print(indexPath)
//
//            }
//
//        }
//
//    }
    

    
  
    @IBAction func editButton(_ sender: UIButton) {
    }
    
    
//    @IBSegueAction func editSegue(_ coder: NSCoder, sender: UIButton) -> EditTaskViewController? {
//        let vc = Todo.EditTaskViewController(coder: coder)
//        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tableView)
////        if let indexpath = tableView.indexPathForSelectedRow {
////                let task = todotasks[indexpath.row]
////                vc?.task = task
////            print(task)
////            }
//        if  let indexPath = self.tableView.indexPathForRow(at: buttonPosition) {
//          let task = todotasks[indexPath.row]
//
//          vc?.task = task
//
//          print(task)
//
//      }
//
//        return vc
//    }
    
    
    
//    @IBSegueAction func editTaskViewController(_ coder: NSCoder) -> EditTaskViewController? {
//        let vc = Todo.EditTaskViewController(coder: coder)
//        
//        if let indexpath = tableView.indexPathForSelectedRow {
//                let task = todotasks[indexpath.row]
//                vc?.task = task
//            print(task)
//            }
//        
//        return vc
//    }
    
    func configTableView() {
        
    }
    
    
}
//UITableViewDelegate and UITableViewDataSource

extension ViewController
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
          return 5
        }
    
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        return cell
    }
}

//extension ViewController: UITableViewDataSource
//{
//  //function for the number of rows of sections
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//      return todotasks.count
//    }
//
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//            //method for tableView to create the cell's table for us and return the created cell
////            let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! MarkAsDoneTableViewCell
////            cell.delegate = self
////            let task = todotasks[indexPath.row]
////        cell.set(title: task.title, due_date: task.due_date, isCompleted: task.isCompleted)
////            return cell
//    }
//}

//conform to the protocol and implement the method
//find the taks that is associated with this cell and change the switch state based on users input
//extension ViewController: MarkAsDoneTableViewCellDelegate
//{
//    func markAsDoneTableViewCell(_ cell: MarkAsDoneTableViewCell, switchStatus isOn: Bool)
//    {
//        guard let indexPath = tableView.indexPath(for: cell) else
//        {
//            return
//        }
//        //replace the taks with the new to do
//        let task = todotasks[indexPath.row]
//        let newTask = TodoList(title: task.title, due_date: task.due_date, isCompleted: isOn, description: task.description)
//        //add the new task to the array
//        todotasks[indexPath.row] = newTask
//
//
//    }
//}










