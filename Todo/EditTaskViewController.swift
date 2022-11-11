//
//  EditTaskViewController.swift
//  Todo
//
//  Created by Aurela Bala on 2022-11-10.
//

import UIKit

class EditTaskViewController: UIViewController {

   
    @IBOutlet weak var editView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.editView.layer.cornerRadius = 10.0
    }
    


}
