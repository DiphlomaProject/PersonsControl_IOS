//
//  GroupsVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 12.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class GroupsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    lazy var refreshControl:UIRefreshControl =
        {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(GroupsVC.actualData(_:)), for: .valueChanged)
            refreshControl.tintColor = UIColor.white
            return refreshControl
            
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingNewData()
        self.tableview.addSubview(self.refreshControl)
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.ReloadData()
        
       
    }
    
    func LoadingNewData()
    {
        ServiceApiPost.GetGroupsUser(Complete: { (success, loginError) in
            if success {
                
                
                
                
                //      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).title ?? "error" )
                //      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).desc ?? "error" )
                //      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).ownerInfo?.displayName ?? "error" )
                //                for key in SingletonManager.sharedCenter.contentGroup
                //                {
                //
                //                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).title ?? "error" )
                //
                //
                //                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).desc ?? "error" )
                //                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).ownerInfo?.displayName ?? "error" )
                //                    }
                ////
                
               // self.ReloadData()
                self.tableview.reloadData()
                self.refreshControl.endRefreshing()
                
            } else {
                DispatchQueue.main.async {
                    
                    self.AlertMessage()
                }
            }
        })
    }
    
    @objc func actualData(_ refreshControl:UIRefreshControl)
    {
//      SingletonManager.sharedCenter.contentGroup.removeAllObjects()
//        ServiceApiPost.GetGroupsUser(Complete: { (success, loginError) in
//            if success {
//                self.tableview.reloadData()
//                refreshControl.endRefreshing()
//
//            } else {
//                DispatchQueue.main.async {
//
//
//                }
//            }
//        })
        
        LoadingNewData()
//        self.tableview.reloadData()
//        refreshControl.endRefreshing()
       
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupCell
        let key =  SingletonManager.sharedCenter.contentGroup.allKeys[indexPath.row]
        cell.title.text = ((SingletonManager.sharedCenter.contentGroup.object(forKey: key) as! Group).title ?? "error" )
        cell.owner.text = ((SingletonManager.sharedCenter.contentGroup.object(forKey: key) as! Group).ownerInfo?.displayName ?? "error" )
        
        cell.desc.text = ((SingletonManager.sharedCenter.contentGroup.object(forKey: key) as! Group).desc ?? "error" )
        
        return cell

        
    }
    
    
    func numberOfSections(in tableView:UITableView)-> Int
    {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(SingletonManager.sharedCenter.contentGroup.count)
        return SingletonManager.sharedCenter.contentGroup.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let image = self.articles?[indexPath.item].url {
//            let url = URL(string: image)
//            let safari = SFSafariViewController(url: url!)
//            present(safari, animated: true, completion: nil)
        
            
            
        }
    
   
    func AlertMessage()
    {
        let alert = UIAlertController(title: "Server offline", message: "Please try Again", preferredStyle: UIAlertControllerStyle.alert)
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
    
    
    
    }

