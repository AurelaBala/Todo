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
Version: 1.1.0
*/

import UIKit


class ViewController: UIViewController
{
    //an array with several tasks
    var todotasks =
    [
    TodoList(title: "Task 1", due_date: "25 November 2022"),
    TodoList(title: "Task 2", due_date: "30 November 2022"),
    TodoList(title: "Task 3", due_date: "1 December 2022"),
    TodoList(title: "Task 4", due_date: "25 November 2022")
    ]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //custom design for add task button and corner radius for the tableview
        addTaskButton.layer.shadowColor = UIColor.white.cgColor
        addTaskButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        addTaskButton.layer.shadowRadius = 5
        addTaskButton.layer.shadowOpacity = 0.8
        self.tableView.layer.cornerRadius = 10.0
    }
    
    //unwind segue
    @IBAction func goBack(segue: UIStoryboardSegue)
    {
    }

}

extension ViewController: UITableViewDataSource
{
  //function for the number of rows of sections
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      return todotasks.count
    }

    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
            //method for tableView to create the cell's table for us and return the created cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! MarkAsDoneTableViewCell
            cell.delegate = self
            let task = todotasks[indexPath.row]
            cell.set(title: task.title, due_date: task.due_date, isCompleted: task.isCompleted)
            return cell
    }
}

//conform to the protocol and implement the method
//find the taks that is associated with this cell and change the switch state based on users input
extension ViewController: MarkAsDoneTableViewCellDelegate
{
    func markAsDoneTableViewCell(_ cell: MarkAsDoneTableViewCell, switchStatus isOn: Bool)
    {
        guard let indexPath = tableView.indexPath(for: cell) else
        {
            return
        }
        //replace the taks with the new to do
        let task = todotasks[indexPath.row]
        let newTask = TodoList(title: task.title, due_date: task.due_date, isCompleted: isOn)
        //add the new task to the array
        todotasks[indexPath.row] = newTask
    }
}







