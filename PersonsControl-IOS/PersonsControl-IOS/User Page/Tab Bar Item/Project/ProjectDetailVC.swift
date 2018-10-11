//
//  ProjectDetailVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/9/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class ProjectDetailVC: UIViewController {

    var contentText: String?
    @IBOutlet weak var title_label: UILabel!
    
    @IBOutlet weak var customer: UILabel!
    
    @IBOutlet weak var group_list: UILabel!
    
    @IBOutlet weak var time_start: UILabel!
    
    
    @IBOutlet weak var time_end: UILabel!
    
    @IBOutlet weak var desc: UITextView!
    
    
    @IBAction func return_Btn(_ sender: Any) {
        
         navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        if(Int(contentText!) != nil)
        {
            //ProjectDetailVC
            
            
            self.title_label.text = (SingletonManager.sharedCenter.contentProject.object(forKey: contentText as Any)as! UserProject).title
            //self.customer.text = (SingletonManager.sharedCenter.contentGroup.object(forKey: contentText as Any)as! Project).customer
            self.desc.text = (SingletonManager.sharedCenter.contentProject.object(forKey: contentText as Any)as! UserProject).desc
            self.customer.text = (SingletonManager.sharedCenter.contentProject.object(forKey: contentText as Any) as! UserProject).customerInfo?.company
                        let arrayT = ((SingletonManager.sharedCenter.contentProject.object(forKey: contentText as Any) as! UserProject).GroupInfo)
            
                        let stringRepresentation = arrayT.joined(separator: " , ")
            
                        self.group_list.text = stringRepresentation
           // self.time_start.text = (SingletonManager.sharedCenter.contentProject.object(forKey: contentText as Any)as! UserProject).untilTime
           // self.time_end.text = (SingletonManager.sharedCenter.contentProject.object(forKey: contentText as Any)as! UserProject).beginTime
            
            let dateString : String = (SingletonManager.sharedCenter.contentProject.object(forKey: contentText as Any)as! UserProject).untilTime!
            
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
            
            
            let dateString2 : String = (SingletonManager.sharedCenter.contentProject.object(forKey: contentText as Any)as! UserProject).beginTime!
            let dateTask2 = dateFormatter.date(from: dateString2)
            // dateTask = Date()
            let datatime2  = dateFormatter2.string(from: dateTask2!)
            //  print(datatime)
            
            self.time_start.text = datatime
            self.time_end.text = datatime2
        }
        
    }
}
