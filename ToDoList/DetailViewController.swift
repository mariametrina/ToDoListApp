//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Student on 2019-12-03.
//  Student ID - 301089997
//  Copyright © 2019 Centennial College. All rights reserved.
//

import Foundation
import UIKit


class DetailViewController : UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var completedLabel: UILabel!
    
    @IBOutlet weak var notesTextField: UITextField!
    
    var toDo : ToDo = ToDo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.titleLabel.text = self.toDo.title
        
        self.notesTextField.text = self.toDo.notes
        
        if toDo.completed {
            completedLabel.text = "Completed"
        } else {
            completedLabel.text = "Not Completed"

        }
    }
    
    @IBAction func save(_ sender: Any) {
        
        if let note = notesTextField.text {
            self.toDo.notes = note
            Database().save(todo: self.toDo)

        }
    }
    

}

