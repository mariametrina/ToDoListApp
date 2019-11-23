//
//  TodoCell.swift
//  ToDoList
//
//  Created by Student on 2019-11-23.
//  Copyright © 2019 Centennial College. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

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

}
