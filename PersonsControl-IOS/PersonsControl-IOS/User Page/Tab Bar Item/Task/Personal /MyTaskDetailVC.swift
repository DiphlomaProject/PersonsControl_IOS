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
        
        self.date_start.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).dateTimeBegin
        
        self.date_end.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: contentText as Any) as! UserTask).dateTimeEnd
        
       // self.status.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey:  contentText as Any) as! UserTask).isComplite?.description
            
            
            
    }
    
    }
}
