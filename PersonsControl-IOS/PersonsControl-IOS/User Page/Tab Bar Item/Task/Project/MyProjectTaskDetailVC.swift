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
    
    
  //  @IBOutlet weak var status: MDCTextField!
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
            
           // self.data_start.text = (SingletonManager.sharedCenter.contentProjectTask.object(forKey: contentText as Any) as! ProjectTask).dateTimeBegin
            
         //   self.data_end.text = (SingletonManager.sharedCenter.contentProjectTask.object(forKey: contentText as Any) as! ProjectTask).dateTimeEnd
            
           // self.status.text = (SingletonManager.sharedCenter.contentProjectTask.object(forKey:  contentText as Any) as! ProjectTask).isComplite?.description
            
            
            
            let dateString : String = (SingletonManager.sharedCenter.contentProjectTask.object(forKey: contentText as Any) as! ProjectTask).dateTimeBegin!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
            dateFormatter.timeZone = TimeZone.init(abbreviation: "UTC")
            let dateTask = dateFormatter.date(from: dateString)
            // dateTask = Date()
            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateFormat = "dd. MMMM yyyy"//"yyyy-MM-dd"
            let datatime  = dateFormatter2.string(from: dateTask!)
            //  print(datatime)
            
            //  self.date_start.text = datatime
            
            
            let dateString2 : String = (SingletonManager.sharedCenter.contentProjectTask.object(forKey: contentText as Any) as! ProjectTask).dateTimeEnd!
            let dateTask2 = dateFormatter.date(from: dateString2)
            // dateTask = Date()
            let datatime2  = dateFormatter2.string(from: dateTask2!)
            //  print(datatime)
            
           self.data_start.text = datatime
           self.data_end.text = datatime2
        }
        
    }

}
