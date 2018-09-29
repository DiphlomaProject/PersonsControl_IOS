//
//  GroupCell.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 9/29/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var owner: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
