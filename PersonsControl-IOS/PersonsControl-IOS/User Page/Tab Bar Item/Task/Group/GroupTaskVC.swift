//
//  GroupTaskVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/4/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class GroupTaskVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    lazy var refreshControl:UIRefreshControl =
        {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(GroupTaskVC.actualData(_:)), for: .valueChanged)
            refreshControl.tintColor = UIColor.white
            return refreshControl
            
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        customActivityIndicatory(self.view, startAnimate: false)
       // LoadingNewData()
        self.tableview.addSubview(self.refreshControl)
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func LoadingNewData()
    {
        
        customActivityIndicatory(self.view, startAnimate: true)
        ServiceApiPost.GetTasksUser(taskPerson: false , taskGroup: true , taskProject: false,Complete: { (success, loginError)  in
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
        
    }
    
    @objc func actualData(_ refreshControl:UIRefreshControl)
    {
        SingletonManager.sharedCenter.contentGroupTask.removeAllObjects()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTaskCell", for: indexPath) as! GroupTaskCell
        let key =  SingletonManager.sharedCenter.contentGroupTask.allKeys[indexPath.row]
        cell.title.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: key) as! GroupTask).title
        cell.decs.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: key) as! GroupTask).desc
        cell.grom_user.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: key) as! GroupTask).userFrom
        cell.begin_time.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: key) as! GroupTask).dateTimeBegin
        cell.until_time.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: key) as! GroupTask).dateTimeEnd
        cell.group_name.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: key) as! GroupTask).groupName
        cell.status.text = (SingletonManager.sharedCenter.contentGroupTask.object(forKey: key) as! GroupTask).isComplite?.description
        
        return cell
        
        
    }
    
    
    func numberOfSections(in tableView:UITableView)-> Int
    {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(SingletonManager.sharedCenter.contentGroupTask.count)
        return SingletonManager.sharedCenter.contentGroupTask.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController?.isNavigationBarHidden = true
        self.ReloadData()
        self.tableview.addSubview(self.refreshControl)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key =  SingletonManager.sharedCenter.contentGroupTask.allKeys[indexPath.row]
        print((SingletonManager.sharedCenter.contentGroupTask.object(forKey: key) as! GroupTask).id as Any)
        
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
        mainContainer.backgroundColor = UIColor.init(hexString: "#007AFF")
        
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
