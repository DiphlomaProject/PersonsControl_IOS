//
//  GroupDetailVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/9/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class GroupDetailVC: UIViewController {
var contentText: String?
    
    @IBOutlet weak var title_label: UILabel!
    @IBOutlet weak var people: UILabel!
    @IBOutlet weak var owner: UILabel!
    @IBOutlet weak var desc: UITextView!
    
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
//            self.title_lb.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).title
//            
//            self.desc_area.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).desc
//            
//            self.user_from.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).userFrom
//            
//            self.date_start.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).dateTimeBegin
//            
//            self.date_end.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).dateTimeEnd
//            
//            self.status.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey:  contentText as Any) as! UserTask).isComplite?.description
//            
           self.title_label.text = (SingletonManager.sharedCenter.contentGroup.object(forKey: contentText as Any) as! Group).title
            self.owner.text = (SingletonManager.sharedCenter.contentGroup.object(forKey: contentText as Any) as! Group).ownerInfo?.displayName
            self.desc.text = (SingletonManager.sharedCenter.contentGroup.object(forKey: contentText as Any) as! Group).desc
            //      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).desc ?? "error" )
            //      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).ownerInfo?.displayName ?? "error" )
            
        }
        
    }

}
