//
//  TaskViewController.swift
//  Todo
//
//  Created by Aurela Bala on 2022-11-23.
//

import UIKit

protocol TaskViewControllerDelegate: AnyObject {
    func TaskViewController (_ vc: TaskViewController, saveTask: TodoList)
}

class TaskViewController: UIViewController {
    
    @IBOutlet weak var newTastName: UITextField!
    var task: TodoList?
    weak var delegate: TaskViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        newTastName.text = task?.title
    }
    

    @IBAction func addTask(_ sender: UIButton) {
        let task = TodoList(title: newTastName.text!, due_date: "", description: "")
        delegate?.TaskViewController(self, saveTask: task)
    }
    
}
