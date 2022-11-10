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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource
{

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return todotasks.count
//    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return todotasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let task = todotasks[indexPath.row]
        let cell = UITableViewCell()
        let title = task.title
        let due_date = task.due_date
        cell.textLabel!.numberOfLines = 0
        cell.textLabel?.text = title + "\n" + due_date
       
        return cell
    }
  
}

