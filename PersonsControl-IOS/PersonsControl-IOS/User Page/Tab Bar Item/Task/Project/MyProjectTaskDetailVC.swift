//
//  MyProjectTaskDetailVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/8/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit
import  MaterialComponents
class MyProjectTaskDetailVC: UIViewController {
 var contentText: String?
    
    
    @IBOutlet weak var status: MDCTextField!
    @IBOutlet weak var data_end: MDCTextField!
    @IBOutlet weak var data_start: MDCTextField!
    @IBOutlet weak var userFrom: MDCTextField!
    @IBOutlet weak var title_label: MDCTextField!
    @IBOutlet weak var desc_area: MDCIntrinsicHeightTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        if(Int(contentText!) != nil)
        {
            self.title_label.text = (SingletonManager.sharedCenter.contentProjectTask.object(forKey: contentText as Any) as! ProjectTask).title
            
            self.desc_area.text = (SingletonManager.sharedCenter.contentProjectTask.object(forKey: contentText as Any) as! ProjectTask).desc
            
            self.userFrom.text = (SingletonManager.sharedCenter.contentProjectTask.object(forKey: contentText as Any) as! ProjectTask).userFrom
            
            self.data_start.text = (SingletonManager.sharedCenter.contentProjectTask.object(forKey: contentText as Any) as! ProjectTask).dateTimeBegin
            
            self.data_end.text = (SingletonManager.sharedCenter.contentProjectTask.object(forKey: contentText as Any) as! ProjectTask).dateTimeEnd
            
            self.status.text = (SingletonManager.sharedCenter.contentProjectTask.object(forKey:  contentText as Any) as! ProjectTask).isComplite?.description
        }
        
    }

}
