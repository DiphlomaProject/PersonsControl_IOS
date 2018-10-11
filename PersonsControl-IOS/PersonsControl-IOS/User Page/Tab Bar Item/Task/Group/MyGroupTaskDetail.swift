//
//  MyGroupTaskDetail.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/8/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit
import MaterialComponents
class MyGroupTaskDetail: UIViewController {
    var contentText: String?
    @IBOutlet weak var title_label: MDCTextField!
    
    @IBOutlet weak var desc_Area: MDCIntrinsicHeightTextView!
    
    @IBOutlet weak var userFrom: MDCTextField!
    
    
    @IBOutlet weak var timeStart: MDCTextField!
    
    @IBOutlet weak var timeEnd: MDCTextField!
    
   // @IBOutlet weak var statuds: MDCTextField!
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
            self.title_label.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: contentText as Any) as! GroupTask).title
            
            self.desc_Area.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: contentText as Any) as! GroupTask).desc
            
            self.userFrom.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: contentText as Any) as! GroupTask).userFrom
            
//            self.timeStart.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: contentText as Any) as! GroupTask).dateTimeBegin
//
//            self.timeEnd.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: contentText as Any) as! GroupTask).dateTimeEnd
            
          //  self.statuds.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey:  contentText as Any) as! GroupTask).isComplite?.description
            let dateString : String = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: contentText as Any) as! GroupTask).dateTimeBegin!
            
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
            
            
            let dateString2 : String = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: contentText as Any) as! GroupTask).dateTimeEnd!
            let dateTask2 = dateFormatter.date(from: dateString2)
            // dateTask = Date()
            let datatime2  = dateFormatter2.string(from: dateTask2!)
            //  print(datatime)
            
            self.timeStart.text = datatime
            self.timeEnd.text = datatime2
        }

}

}
