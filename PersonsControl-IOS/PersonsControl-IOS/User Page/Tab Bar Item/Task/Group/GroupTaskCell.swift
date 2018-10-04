//
//  GroupTaskCell.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/4/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class GroupTaskCell: UITableViewCell {

    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var begin_time: UILabel!
    @IBOutlet weak var until_time: UILabel!
    @IBOutlet weak var group_name: UILabel!
    @IBOutlet weak var decs: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var grom_user: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
