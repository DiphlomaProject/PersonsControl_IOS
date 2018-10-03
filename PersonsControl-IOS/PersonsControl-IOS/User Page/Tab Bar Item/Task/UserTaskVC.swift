//
//  UserTaskVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/4/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import GoogleSignIn
import LocalAuthentication
class UserTaskVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableview: UITableView!
    
    lazy var refreshControl:UIRefreshControl =
        {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(UserTaskVC.actualData(_:)), for: .valueChanged)
            refreshControl.tintColor = UIColor.white
            return refreshControl
            
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        customActivityIndicatory(self.view)
        LoadingNewData()
        self.tableview.addSubview(self.refreshControl)
        tableview.delegate = self
        tableview.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func LoadingNewData()
    {
        
        customActivityIndicatory(self.view, startAnimate: true)
        ServiceApiPost.GetTasksUser(Complete: { (success, loginError)  in
            if success {
                self.customActivityIndicatory(self.view, startAnimate: false)
                self.tableview.reloadData()
                self.refreshControl.endRefreshing()
                
            } else {
                DispatchQueue.main.async {
                    self.customActivityIndicatory(self.view, startAnimate: false)
                    self.AlertMessage(message: "You are not have task")
                    self.tableview.reloadData()
                    
                }
            }
        })
        
        
        
//        ServiceApiPost.GetTasksUser(Complete: { (success, loginError) in
//            if success {
//
//                print("tasks")
//                for key in SingletonManager.sharedCenter.contentPersonalTask
//                {
//
//                    print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key.key) as! UserTask).title ?? "error" )
//                    print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key.key) as! UserTask).desc ?? "error" )
//                    print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key.key) as! UserTask).userFrom ?? "error" )
//
//                    print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key.key) as! UserTask).dateTimeBegin ?? "error" )
//                    print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key.key) as! UserTask).dateTimeEnd ?? "error" )
//                    print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key.key) as! UserTask).isComplite ?? "error" )
//
//
//                }
//                //
//
//            } else {
//                DispatchQueue.main.async {
//                    print("error")
//                }
//            }
//        })
    }
    
    @objc func actualData(_ refreshControl:UIRefreshControl)
    {
        SingletonManager.sharedCenter.contentPersonalTask.removeAllObjects()
        LoadingNewData()
        self.tableview.reloadData()
        refreshControl.endRefreshing()
        
    }
    func ReloadData()
    {
        if(self.tableview != nil)
        {
            self.tableview.reloadData()
        }
        
        
    }
    
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTaskCell", for: indexPath) as! UserTaskCell
        let key =  SingletonManager.sharedCenter.contentPersonalTask.allKeys[indexPath.row]
        cell.title.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).title
        cell.desc.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).desc
        cell.from_user.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).userFrom
        cell.time_begin.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeBegin
         cell.until_time.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeEnd
        
        cell.status.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).isComplite?.description
       
        return cell
        
        
    }
    
    
    func numberOfSections(in tableView:UITableView)-> Int
    {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(SingletonManager.sharedCenter.contentPersonalTask.count)
        return SingletonManager.sharedCenter.contentPersonalTask.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.ReloadData()
        self.tableview.addSubview(self.refreshControl)
    }
    
    func setFaceID_TouchID(_ flag: Bool) {
        TouchID()
    }
    
    func TouchID()
    {
        let context : LAContext = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate to proceed.", reply: { ( wasCorrect, error) in
                if wasCorrect
                {
                    print("access")
                }else
                {
                    print("error")
                    let home =  UserTaskVC()
                    home.setFaceID_TouchID(true)
                }
            })
        }else
        {
            //else
            print("no used")
        }
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key =  SingletonManager.sharedCenter.contentPersonalTask.allKeys[indexPath.row]
        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id as Any)
        
    }
    
    
    func AlertMessage(message: String )
    {
        let alert = UIAlertController(title: message, message: "Please try Again", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @discardableResult
    func customActivityIndicatory(_ viewContainer: UIView, startAnimate:Bool? = true) -> UIActivityIndicatorView {
        let mainContainer: UIView = UIView(frame: viewContainer.frame)
        mainContainer.center = viewContainer.center
        // mainContainer.backgroundColor = UIColor.init(hexString: "0xFFFFFF")
        mainContainer.backgroundColor = UIColor.init(hexString: "#0000FF")
        
        mainContainer.alpha = 0.5
        mainContainer.tag = 789456123
        mainContainer.isUserInteractionEnabled = false
        
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x:0,y: 0,width: 80,height: 80))
        viewBackgroundLoading.center = viewContainer.center
        //        viewBackgroundLoading.backgroundColor = UIColor.init(hexString: "0x444444")
        viewBackgroundLoading.backgroundColor = UIColor.init(hexString: "#000000")
        viewBackgroundLoading.alpha = 0.5
        viewBackgroundLoading.clipsToBounds = true
        viewBackgroundLoading.layer.cornerRadius = 15
        
        let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.frame = CGRect(x:0.0,y: 0.0,width: 40.0, height: 40.0)
        activityIndicatorView.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        activityIndicatorView.center = CGPoint(x: viewBackgroundLoading.frame.size.width / 2, y: viewBackgroundLoading.frame.size.height / 2)
        if startAnimate!{
            viewBackgroundLoading.addSubview(activityIndicatorView)
            mainContainer.addSubview(viewBackgroundLoading)
            viewContainer.addSubview(mainContainer)
            activityIndicatorView.startAnimating()
        }else{
            for subview in viewContainer.subviews{
                if subview.tag == 789456123{
                    subview.removeFromSuperview()
                }
            }
        }
        return activityIndicatorView
    }

}
