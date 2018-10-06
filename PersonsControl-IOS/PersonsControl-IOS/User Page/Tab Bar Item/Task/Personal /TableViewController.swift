//
//  TableViewController.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/5/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit
import SideMenu
class TableViewController: UITableViewController,MGSwipeTableCellDelegate {
 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceApiPost.GetImageUser(regComplete: { (success, loginError) in
            if success {
                print("image load")
                
            } else {
                DispatchQueue.main.async {
                    print("error")
                }
            }
        })
         refreshControl = UIRefreshControl()
        refreshControl =
            {
                let refreshControl = UIRefreshControl()
                refreshControl.addTarget(self, action: #selector(TableViewController.actualData(_:)), for: .valueChanged)
               // refreshControl.tintColor = UIColor.white
                return refreshControl
                
        }()
        
        
        tableView.rowHeight = 66
        
        
        customActivityIndicatory(self.view, startAnimate: false)
        LoadingNewData()
       // tableView.addSubview(self.refreshControl)
        tableView.addSubview(self.refreshControl!)
        
    }
    
    
    func LoadingNewData()
    {
        
        customActivityIndicatory(self.view, startAnimate: true)
        ServiceApiPost.GetTasksUser(taskPerson: true , taskGroup: true , taskProject: true, Complete: { (success, loginError)  in
            if success {
                self.customActivityIndicatory(self.view, startAnimate: false)
                self.tableView.reloadData()
               // self.refreshControl.endRefreshing()
                self.refreshControl?.endRefreshing()
                
            } else {
                DispatchQueue.main.async {
                    self.customActivityIndicatory(self.view, startAnimate: false)
                    self.MessagerAlert(mitTitel: "You are not have task")
                    self.tableView.reloadData()
                    
                }
            }
        })
        
    }
    
    @objc func actualData(_ refreshControl:UIRefreshControl)
    {
        SingletonManager.sharedCenter.contentPersonalTask.removeAllObjects()
        LoadingNewData()
        tableView.reloadData()
        //refreshControl.endRefreshing()
        self.refreshControl?.endRefreshing()
        
    }
    func ReloadData()
    {
        if(tableView != nil)
        {
            tableView.reloadData()
        }
        
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SingletonManager.sharedCenter.contentPersonalTask.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key =  SingletonManager.sharedCenter.contentPersonalTask.allKeys[indexPath.row]
        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id as Any)
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PresonalTask", for: indexPath) as! MGSwipeTableCell
        //info
        let key =  SingletonManager.sharedCenter.contentPersonalTask.allKeys[indexPath.row]
//        cell.title.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).title
//        cell.desc.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).desc
//        cell.from_user.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).userFrom
//        cell.time_begin.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeBegin
//        cell.until_time.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeEnd
//
//        cell.status.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).isComplite?.description
        cell.textLabel!.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).title
        cell.detailTextLabel!.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).desc
        
        
        //info
        /////////// custom
                let rightButton = MGSwipeButton(title: "", icon: UIImage(named:"check"), backgroundColor: .green , callback: { (sender: MGSwipeTableCell!) in
                    self.MessagerAlert(mitTitel: "Done")
                    return true
                })
        
        let right2Button = MGSwipeButton(title: "", icon: UIImage(named:"more"), backgroundColor: UIColor.orange, callback: { (sender: MGSwipeTableCell!) in
            self.MessagerAlert(mitTitel: "Deteil")
            return true
        })
        cell.rightSwipeSettings.transition = .rotate3D
        
                rightButton.setPadding(30)
                cell.rightExpansion.buttonIndex = 0
                cell.rightButtons = [rightButton,right2Button]
                right2Button.setPadding(10)
        
        return cell
    }
    
    func MessagerAlert(mitTitel : String){
        let alert =  UIAlertController(title: mitTitel, message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in })
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.ReloadData()
        tableView.addSubview(self.refreshControl!)
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
extension TableViewController: UISideMenuNavigationControllerDelegate {

    func sideMenuWillAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
    }

    func sideMenuDidAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appeared! (animated: \(animated))")
    }

    func sideMenuWillDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappearing! (animated: \(animated))")
    }

    func sideMenuDidDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappeared! (animated: \(animated))")
    }
}
