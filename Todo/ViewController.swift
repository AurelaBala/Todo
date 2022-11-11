//
//  ViewController.swift
//  Todo
//
//  Created by Aurela Bala on 2022-11-09.
//

import UIKit

class ViewController: UIViewController {
    
    let todotasks =
    [
    TodoList(title: "Task 1", due_date: "25 Nov"),
    TodoList(title: "Task 2", due_date: "Overdue"),
    TodoList(title: "Task 3", due_date: "1 Dec"),
    TodoList(title: "Task 4", due_date: "25 Nov")
    ]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaskButton.layer.shadowColor = UIColor.white.cgColor
        addTaskButton.layer.shadowOffset = CGSize(width: 2, height: 2)
            addTaskButton.layer.shadowRadius = 5
            addTaskButton.layer.shadowOpacity = 1.0
        
        self.tableView.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource
{

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return todotasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //method for tableView to create the cell table for us
        let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! MarkAsDoneTableViewCell
        
        let task = todotasks[indexPath.row]
        //let cell = MarkAsDoneTableViewCell()
        let title = task.title
        let due_date = task.due_date
        //cell.textLabel!.numberOfLines = 0
        //cell.textLabel?.text = title + "\n" + due_date
        cell.set(title: title, due_date: due_date, isCompleted: task.isCompleted)
        return cell
    }
  
}

