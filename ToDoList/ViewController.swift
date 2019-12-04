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
    var todoL : [String] = ["Buy Milk", "Call Mom", "Do Assignment"]    //test
    var allToDo : [ToDo] = []    //test


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoTview.delegate = self
        todoTview.dataSource = self
        todoTview.rowHeight = 80
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.showDetail),
            name: Notification.Name("showDetail"),
            object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getAllTodo()

    }
    
    func getAllTodo(){
        self.allToDo = Database().getAll()
        todoTview.reloadData()
    }
    
    @objc func showDetail(notification: NSNotification){
        if let todo = notification.object as? ToDo {
            self.performSegue(withIdentifier: "SegueDetail", sender: todo)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueDetail" {
            
            guard let todo = sender as? ToDo else {return}
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.toDo = todo
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allToDo.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoCell
        let todo = allToDo[indexPath.row]
        cell.toDo = todo
        
        cell.todoLabel.text = todo.title
        
        if todo.completed {
            cell.checkImg.image = UIImage(named: "Tickimg.png")
            cell.checkBtnV = true
        } else {
            cell.checkImg.image = nil
            cell.checkBtnV = false
        }
        
        return cell
        
    }
   
    //function to show tick mark on click
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let cell = tableView.cellForRow(at: indexPath) as! TodoCell
        if cell.checkBtnV == false{
            cell.checkImg.image = UIImage(named: "Tickimg.png")
            cell.checkBtnV = true
        }
        else{
            cell.checkImg.image = nil
            cell.checkBtnV = false
        }*/
        
        let todo = allToDo[indexPath.row]
        if todo.completed {
            todo.completed = false
        } else {
            todo.completed = true
        }
        Database().save(todo: todo)
        self.getAllTodo()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //function to delete a todo on swipe
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let todo = allToDo[indexPath.row]
            Database().delete(todo: todo)
            self.getAllTodo()
            //todoL.remove(at: indexPath.row)
            //todoTview.reloadData()
        }
    }
    
    //function to show new popup to create new todos
    
    @IBAction func createTodo(_ sender: Any) {
        
        let todoAlert = UIAlertController(title: "Add New", message: "Create a new Todo", preferredStyle: .alert)
        
        todoAlert.addTextField()
        
        let createNew = UIAlertAction(title: "Add", style: .default) {(action) in
            guard let title = todoAlert.textFields![0].text else {return}
            
            let newTodo = ToDo(title: title)
            Database().save(todo: newTodo)
            self.allToDo.append(newTodo)
            //elf.todoL.append(newTodo.text!)
            self.todoTview.reloadData()
            
        }
        
        let cancelact = UIAlertAction(title: "Cancel", style: .default)
        todoAlert.addAction(createNew)
        todoAlert.addAction(cancelact)
        present(todoAlert, animated: true, completion: nil)
        
    }
    
}

class ToDo {
    var title : String = ""
    var completed: Bool = false
    var notes: String = ""
    init(){
        
    }
    
    init(title: String){
        self.title = title
    }
    init(title:String, completed: Bool, notes: String) {
        self.title = title
        self.completed = completed
        self.notes = notes
    }
    
    init(json:[String:Any]){
        
        if let title = json["title"] as? String {
            self.title = title
        }
        if let notes = json["notes"] as? String {
            self.notes = notes
        }
        if let completed = json["completed"] as? Bool {
            self.completed = completed
        }
    
    }
    
    func toJSON()->[String:Any] {
        let json : [String:Any] = [
            "title" : self.title,
            "completed" : completed,
            "notes" : self.notes
        ]
        
        return json
    }
    
}

