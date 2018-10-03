//
//  ProjectCell.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var groups_names: UILabel!
    @IBOutlet weak var company_name: UILabel!
    @IBOutlet weak var customer_name: UILabel!
    @IBOutlet weak var project_name: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
