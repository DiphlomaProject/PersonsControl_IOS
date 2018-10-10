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
            
            self.timeStart.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: contentText as Any) as! GroupTask).dateTimeBegin
            
            self.timeEnd.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: contentText as Any) as! GroupTask).dateTimeEnd
            
          //  self.statuds.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey:  contentText as Any) as! GroupTask).isComplite?.description
        }

}

}
