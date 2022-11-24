//
//  TaskViewController.swift
//  Todo
//
//  Created by Aurela Bala on 2022-11-23.
//

import UIKit



class TaskViewController: UIViewController {
    
    @IBOutlet weak var newTastName: UITextField!
    var task: TodoList?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addTask(_ sender: UIButton) {
    }
    
}
