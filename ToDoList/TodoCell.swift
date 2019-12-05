//
//  TodoCell.swift
//  ToDoList
//
//  Created by Maria on 2019-11-23.
//  Student ID - 301089997
//  Copyright © 2019 Centennial College. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
    
    var toDo = ToDo()

    var  checkBtnV = false
    
    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var todoLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func showToDoDetails(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("showDetail"), object: self.toDo)

        
    }
}
