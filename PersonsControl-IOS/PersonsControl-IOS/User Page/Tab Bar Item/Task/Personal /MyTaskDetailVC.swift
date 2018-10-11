//
//  MyTaskDetailVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/8/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class MyTaskDetailVC: UIViewController {
var contentText: String?
    
    @IBOutlet weak var title_lb: UITextField!
    
    @IBOutlet weak var desc_area: UITextView!
    @IBOutlet weak var user_from: UITextField!
    @IBOutlet weak var date_start: UITextField!
    @IBOutlet weak var date_end: UITextField!
    //@IBOutlet weak var status: UITextField!
    
    @IBAction func returnBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
//    func LoadData(label : String)
//    {
//
//
//            self.labeltest.text = label
//            //self.label2.text = contentText2!
//
//    }
    override func viewWillAppear(_ animated: Bool) {

        
        if(Int(contentText!) != nil)
        {
        self.title_lb.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).title
        
        self.desc_area.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).desc
        
        self.user_from.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).userFrom
        
        //self.date_start.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).dateTimeBegin
        
       // self.date_end.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).dateTimeEnd
            
            
            let dateString : String = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).dateTimeBegin!
            
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
            
            
            let dateString2 : String = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).dateTimeEnd!
            let dateTask2 = dateFormatter.date(from: dateString2)
            // dateTask = Date()
            let datatime2  = dateFormatter2.string(from: dateTask2!)
            //  print(datatime)
            
            self.date_start.text = datatime
            self.date_end.text = datatime2
       // self.status.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey:  contentText as Any) as! UserTask).isComplite?.description
            
            
            
    }
    
    }
}
