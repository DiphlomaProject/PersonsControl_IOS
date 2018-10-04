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
        //self.navigationController!.navigationBar.topItem!.title = "Groups";
         self.navigationController?.isNavigationBarHidden = true
        customActivityIndicatory(self.view)
        LoadingNewData()
        self.tableview.addSubview(self.refreshControl)
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController?.isNavigationBarHidden = false
        //self.navigationController!.navigationBar.topItem!.title = "Groups";
         self.navigationController?.isNavigationBarHidden = true
        self.ReloadData()
        self.tableview.addSubview(self.refreshControl)
       
    }
    
    func LoadingNewData()
    {
        customActivityIndicatory(self.view, startAnimate: true)
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
                self.customActivityIndicatory(self.view, startAnimate: false)
                self.tableview.reloadData()
                self.refreshControl.endRefreshing()
                
            } else {
                DispatchQueue.main.async {
                     self.customActivityIndicatory(self.view, startAnimate: false)
                    self.AlertMessage(message: "You are not in groups")
                    self.tableview.reloadData()
                  
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
        SingletonManager.sharedCenter.contentGroup.removeAllObjects()
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
        let key =  SingletonManager.sharedCenter.contentGroup.allKeys[indexPath.row]
        print((SingletonManager.sharedCenter.contentGroup.object(forKey: key) as! Group).id as Any)

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

extension UIColor {
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        let red, green, blue, alpha: CGFloat
        switch chars.count {
        case 3:
            chars = chars.flatMap { [$0, $0] }
            fallthrough
        case 6:
            chars = ["F","F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            return nil
        }
        self.init(red: red, green: green, blue:  blue, alpha: alpha)
    }
}
