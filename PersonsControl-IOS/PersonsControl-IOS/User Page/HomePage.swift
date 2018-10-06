//
//  HomePage.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/6/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
  @IBOutlet weak var menubtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil
        {
            menubtn.target = self.revealViewController()
            menubtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Do any additional setup after loading the view.
    }
    

}
