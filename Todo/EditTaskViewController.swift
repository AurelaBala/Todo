//
//  EditTaskViewController.swift
//  Todo
//
//  Created by Aurela Bala on 2022-11-10.
//

import UIKit
import SwiftUI

class EditTaskViewController: UIViewController {

   
    @IBOutlet weak var editView: UIView!
    
    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var taskDescription: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.editView.layer.cornerRadius = 10.0
        editTitle.layer.cornerRadius = 10
        taskDescription.layer.cornerRadius = 10
        editTitle.layer.borderWidth = 1
        taskDescription.layer.borderWidth = 1
        editTitle.layer.borderColor = UIColor(hue: 0.65, saturation: 0.57, brightness: 0.92, alpha: 1).cgColor
        taskDescription.layer.borderColor = UIColor(hue: 0.65, saturation: 0.57, brightness: 0.92, alpha: 1).cgColor
        
    }
    
    
    


}
