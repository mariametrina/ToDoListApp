//
//  ViewController.swift
//  ToDoList
//
//  Created by Maria on 2019-11-13.
//  Copyright © 2019 Centennial College. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoTview.delegate = self
        todoTview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        return cell
        
        <#code#>
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        <#code#>
    }

    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var todoTview: UITableView!
}

