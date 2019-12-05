//
//  Database.swift
//  ToDoList
//
//  Created by maria on 2019-12-03.
//  Copyright © 2019 Centennial College. All rights reserved.
//

import Foundation


class Database {
    
    
    func save(todo: ToDo) {
        
        UserDefaults.standard.set(todo.toJSON(), forKey: todo.title) //setObject


    }
    
    func delete(todo: ToDo) {
        
        UserDefaults.standard.removeObject(forKey: todo.title)
        UserDefaults.standard.synchronize()

        
    }
    
   
    
    func getAll()->[ToDo] {
        
        var allToDo : [ToDo] = []
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            if let todoJSON =  UserDefaults.standard.value(forKey: key) as? [String:Any] {
                let todo = ToDo(json: todoJSON)
                allToDo.append(todo)
            }
        }
        
        return allToDo.sorted{ $0.title < $1.title }
        
    }
}
