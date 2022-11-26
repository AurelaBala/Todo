//
//  ViewController.swift
//  Todo
//
//
/* Created and Developed by
Adriana Diaz Torres - 301157161
Aurela Bala - 301279255
Date Created: 23/11/2022
 Simple To Do List App. This version performs not only the User Interface of the APP, but also functionalities such as create a new taks, see all tasks and edit a task.

 The View Controller is the Todo List Screen that includes the list of all of the tasks and for each item includes a title, a due date, a switch control and an edit button.
 Includes a table view which is populated from the Firebase.
 Screen performs in both modes: portrait and landscape
 Version: 1.2.0
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
    
    let reuseIdentifier = "TaskCell"
    

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
        tableView.backgroundColor = .white
        //call configTableView function
        configTableView()
        
        //shared 
        PostService.shared.fetchAllTasks
        {
            (allItems) in
            self.taskItems = allItems
        }
    }
    
    //unwind segue
    @IBAction func goBack(segue: UIStoryboardSegue)
    {
    }
    
    //on click of plus button, we will navigate to the TaskViewController
    @IBAction func createNewTaskBttn(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TaskViewController") as! TaskViewController
        present(vc, animated: true)
    }
    
//configure tableview method
    func configTableView()
    {
        tableView.register(TaskCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
}

//UITableViewDelegate and UITableViewDataSource
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
    
    //deselect row on cell click
    func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}











