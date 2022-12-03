//
//  ViewController.swift
//  Todo
//
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 01/12/2022
 Simple To Do List App. This version performs not only the User Interface of the APP, but also functionalities such as create a new taks, see all tasks, edit a task and delete a task.

 The View Controller is the Todo List Screen that includes the list of all of the tasks and for each item includes a title and a due date, and also performs action on swipe left and swipe right.
 Includes a table view which is populated from the Firebase.
 Screen performs in both modes: portrait and landscape
 Version: 1.3.0
 */

import UIKit
import SwiftUI


class ViewController: UIViewController
{
    var taskItems = [TaskItem]()
    {
        //if all task items are setted then reaload the data in the table view
        didSet
        {
            tableView.reloadData()
        }
    }
    //identifier of the cell
    let reuseIdentifier = "TaskCell"

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
   
    static var taskIdOnSwipe = ""
    
    public func getID(id: String)
    {
        ViewController.taskIdOnSwipe = id
        print(ViewController.taskIdOnSwipe)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //custom design for add task button and corner radius for the tableview
        addTaskButton.layer.shadowColor = UIColor.white.cgColor
        addTaskButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        addTaskButton.layer.shadowRadius = 5
        addTaskButton.layer.shadowOpacity = 0.8
        self.tableView.layer.cornerRadius = 10.0
        tableView.backgroundColor = .white
        //call configTableView function
        configTableView()
        viewDidAppear(true)
        fetchAllTasks()
    }
    
    //unwind segue
    @IBAction func goBack(segue: UIStoryboardSegue)
    {
        fetchAllTasks()
        viewDidAppear(true)
    }
    
    //on click of plus button, we will navigate to the TaskViewController
    @IBAction func createNewTaskBttn(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TaskViewController") as! TaskViewController
        present(vc, animated: true)
    }
    
    //API
    func fetchAllTasks()
    {
        //shared property
        PostService.shared.fetchAllTasks
        {
            (allItems) in
            self.taskItems = allItems
        }
    }
    
//configure tableview method
    func configTableView()
    {
        tableView.register(TaskCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    //object function for navigation from ViewController to EditTaskViewController
    @objc func editTaskDetails ()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController
        present(vc, animated: true)
    }
    //reload table view data
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
  
    
}

//UITableViewDelegate and UITableViewDataSource

extension ViewController: UITableViewDelegate
{
    //leading swipe action (from left to right)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //get task ID
        let selectedID = taskItems[indexPath.row].taskID.self
        let vc = EditTaskViewController()
        //on swipe left action
        let action = UIContextualAction(style: .normal, title: "Task details") { action, view, complete in
            //get the task id and pass it to the edit task view controller
            vc.getID(a: selectedID)
            //perform segue
            self.performSegue(withIdentifier: "toedit", sender: selectedID)
        }
        //change the swipe affect color to blue
        action.backgroundColor =  UIColor.blue
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    //trailing swipe action (from right to left)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //get task id and isCompleted state
        let selectedID = taskItems[indexPath.row].taskID.self
        let toggle = taskItems[indexPath.row].isCompleted.self
        //let taskName = taskItems[indexPath.row].name.self

        var newToggle = true
        var actionTitle = ""
        //if task is completed then make new toggle false
        if(toggle == true)
        {
          newToggle = false
          actionTitle = "uncomplete"
        }
        //if task is uncompleted then make new toggle true
        else
        {
            newToggle = true
            actionTitle = "complete"
        }
        
        //on short swipe display complete toggle and change the value also in the firebase
        let isCompleted = UIContextualAction(style: .normal, title: actionTitle) { action, view, complete in
            print ("Completed")
           // print(TaskCell.hey)
            print(ViewController.taskIdOnSwipe)
            PostService.shared.makeCompleted(taskID: selectedID, isCompleted:
            newToggle) {(error, reference) in
            self.fetchAllTasks()
            }
        }
        //on long swipe delete the task from the firebase
        let delete = UIContextualAction(style: .normal, title: "") { action, view, complete in
            print ("Deleted")
            print(ViewController.taskIdOnSwipe)
            PostService.shared.deleteTask(taskID: selectedID) {(error, reference) in
            print("done")
                                }
            self.fetchAllTasks()
           
        }
        //change the swipe affect color to yellow
        isCompleted.backgroundColor =  UIColor.yellow
        delete.backgroundColor = UIColor.yellow
        return UISwipeActionsConfiguration(actions: [delete, isCompleted])
    }
    
}


extension ViewController: UITableViewDataSource
{
    //return the number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
           return taskItems.count
        }
    //return each task
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TaskCell else { return UITableViewCell()}
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        cell.contentView.isUserInteractionEnabled = false
        cell.taskItem = taskItems[indexPath.row]
        return cell
    }
}











