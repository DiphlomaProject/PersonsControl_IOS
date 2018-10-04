//
//  ProjectTaskCell.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/4/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class ProjectTaskCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var from_user: UILabel!
    @IBOutlet weak var project_name: UILabel!
    @IBOutlet weak var until_time: UILabel!
    @IBOutlet weak var time_begin: UILabel!
    @IBOutlet weak var status: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
