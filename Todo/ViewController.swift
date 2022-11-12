//
//  ViewController.swift
//  Todo
//
//  Created by Aurela Bala on 2022-11-09.
//

import UIKit


class ViewController: UIViewController {
    
    var todotasks =
    [
    TodoList(title: "Task 1", due_date: "25 November 2022"),
    TodoList(title: "Task 2", due_date: "30 November 2022"),
    TodoList(title: "Task 3", due_date: "1 December 2022"),
    TodoList(title: "Task 4", due_date: "25 November 2022")
    ]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaskButton.layer.shadowColor = UIColor.white.cgColor
        addTaskButton.layer.shadowOffset = CGSize(width: 1, height: 1)
            addTaskButton.layer.shadowRadius = 5
        addTaskButton.layer.shadowOpacity = 0.8
        
        self.tableView.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
        
    }

}

extension ViewController: UITableViewDataSource
{

    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      return todotasks.count
    }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //method for tableView to create the cell table for us
        let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! MarkAsDoneTableViewCell
        cell.delegate = self
        let task = todotasks[indexPath.row]
       
       cell.set(title: task.title, due_date: task.due_date, isCompleted: task.isCompleted)
       
        print (task.isCompleted)
        return cell
        
    }
  
}

//conform to the protocol and implement the method
//find the taks that is associated with this cell and change the switch state based on users input
extension ViewController: MarkAsDoneTableViewCellDelegate {
    func markAsDoneTableViewCell(_ cell: MarkAsDoneTableViewCell, switchStatus isOn: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        let task = todotasks[indexPath.row]
        let newTask = TodoList(title: task.title, due_date: task.due_date, isCompleted: isOn)
        
        //add the new task to the array
        todotasks[indexPath.row] = newTask
    }
    
    
}

