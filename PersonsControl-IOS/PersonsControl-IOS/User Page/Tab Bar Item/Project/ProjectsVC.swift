//
//  ProjectsVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 12.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class ProjectsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var valueToPass : String!
    @IBOutlet weak var tableview: UITableView!
     @IBOutlet weak var menubtn: UIBarButtonItem!
    lazy var refreshControl:UIRefreshControl =
        {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(ProjectsVC.actualData(_:)), for: .valueChanged)
            refreshControl.tintColor = UIColor.white
            return refreshControl
            
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil
        {
            menubtn.target = self.revealViewController()
            menubtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        customActivityIndicatory(self.view)
        LoadingNewData()
        self.tableview.addSubview(self.refreshControl)
        tableview.delegate = self
        tableview.dataSource = self
    
        

    }
    
    func LoadingNewData()
    {
        
        customActivityIndicatory(self.view, startAnimate: true)
           ServiceApiPost.GetProjectsUser(Complete: { (success, loginError)  in
            if success {
                self.customActivityIndicatory(self.view, startAnimate: false)
                self.tableview.reloadData()
                self.refreshControl.endRefreshing()
                
            } else {
                DispatchQueue.main.async {
                    self.customActivityIndicatory(self.view, startAnimate: false)
                    self.AlertMessage(message: "You are not in projects")
                    self.tableview.reloadData()
                    
                }
            }
        })
    }
    
    @objc func actualData(_ refreshControl:UIRefreshControl)
    {
        SingletonManager.sharedCenter.contentProject.removeAllObjects()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectCell
        let key =  SingletonManager.sharedCenter.contentProject.allKeys[indexPath.row]
        cell.project_name.text = ((SingletonManager.sharedCenter.contentProject.object(forKey: key) as! UserProject).title )
        
        cell.customer_name.text = (SingletonManager.sharedCenter.contentProject.object(forKey: key) as! UserProject).customerInfo?.contactPerson
        
        cell.company_name.text = (SingletonManager.sharedCenter.contentProject.object(forKey: key) as! UserProject).customerInfo?.company
        let arrayT = ((SingletonManager.sharedCenter.contentProject.object(forKey: key) as! UserProject).GroupInfo)
        
        let stringRepresentation = arrayT.joined(separator: " | ")
        
        cell.groups_names.text = stringRepresentation
        
     //  let stringRepresentation = "-".join(array) // "1-2-3"
        cell.data.text = (SingletonManager.sharedCenter.contentProject.object(forKey: key) as! UserProject).untilTime
        return cell
        
        
    }
    
    
    func numberOfSections(in tableView:UITableView)-> Int
    {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       print(SingletonManager.sharedCenter.contentProject.count)
        return SingletonManager.sharedCenter.contentProject.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
  
        self.ReloadData()
        self.tableview.addSubview(self.refreshControl)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key =  SingletonManager.sharedCenter.contentProject.allKeys[indexPath.row]
        print((SingletonManager.sharedCenter.contentProject.object(forKey: key) as! UserProject).id as Any)
        
        
        //GroupDetailVC
        let selelectrow : Int = (SingletonManager.sharedCenter.contentProject.object(forKey: key) as! UserProject).id!
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ProjectDetailVC") as! ProjectDetailVC
        valueToPass = String (selelectrow)
        newViewController.contentText = valueToPass
        self.show(newViewController, sender: nil)
        print(valueToPass)
        
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


