//
//  ViewController.swift
//  ToDoList
//
//  Created by Maria on 2019-11-13.
//  Copyright © 2019 Centennial College. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var todoTview: UITableView!
    var todoL : [String] = ["Buy Milk", "Call Mom", "Do Assignment"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoTview.delegate = self
        todoTview.dataSource = self
        todoTview.rowHeight = 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoL.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoCell
        
        cell.todoLabel.text = todoL[indexPath.row]
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell
        if cell.checkBtnV == false{
            cell.checkImg.image = UIImage(named: "Tickimg.png")
            cell.checkBtnV = true
        }
        else{
            cell.checkImg.image = nil
            cell.checkBtnV = false
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todoL.remove(at: indexPath.row)
            todoTview.reloadData()
        }
    }
    
    
    @IBAction func createTodo(_ sender: Any) {
        
        let todoAlert = UIAlertController(title: "Add New", message: "Create a new Todo", preferredStyle: .alert)
        
        todoAlert.addTextField()
        
        let createNew = UIAlertAction(title: "Add", style: .default) {(action) in
            let newTodo = todoAlert.textFields![0]
            self.todoL.append(newTodo.text!)
            self.todoTview.reloadData()
            
        }
        
        let cancelact = UIAlertAction(title: "Cancel", style: .default)
        todoAlert.addAction(createNew)
        todoAlert.addAction(cancelact)
        present(todoAlert, animated: true, completion: nil)
        
    }
    
}

