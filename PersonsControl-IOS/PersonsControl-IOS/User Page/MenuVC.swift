//
//  MenuVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/6/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class MenuVC: UITableViewController {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var userName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        self.userName.text = SingletonManager.sharedCenter.UserClass?.DisplayName
        
        self.imageUser.image = SingletonManager.sharedCenter.ImageProfile
        self.imageUser.setRounded()
        
    }
}

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}
