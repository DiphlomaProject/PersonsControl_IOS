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
 
    
    var today : String! = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        today = getTodayString()
        SingletonManager.sharedCenter.time = today
        print(SingletonManager.sharedCenter.time)
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
        
        //2018-10-6 16T:59:11
        //2018-10-06T00:00:00
        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeEnd as Any)
        print("time" + SingletonManager.sharedCenter.time)
        
//        if((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeEnd != SingletonManager.sharedCenter.time)
//        {
            if((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).isComplite?.description == "false")
            {
                if((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeEnd != SingletonManager.sharedCenter.time)
                {
                let fontSize: CGFloat = 14
                let label = UILabel()
                label.font = UIFont.systemFont(ofSize: fontSize)
                label.textAlignment = .center
                label.textColor = UIColor.white
                label.backgroundColor = UIColor.orange
                // Add count to label and size to fit
                label.text = "\("In Progress")"
                label.sizeToFit()
                // Adjust frame to be square for single digits or elliptical for numbers > 9
                var frame: CGRect = label.frame
                frame.size.height += CGFloat(Int(0.4 * fontSize))
                frame.size.width = (15 <= 9) ? frame.size.height : frame.size.width + CGFloat(Int(fontSize))
                label.frame = frame
                // Set radius and clip to bounds
                label.layer.cornerRadius = frame.size.height / 2.0
                label.clipsToBounds = true
                // Show label in accessory view and remove disclosure
                cell.accessoryView = label
                cell.accessoryType = .none
                    
                    let rightButton = MGSwipeButton(title: "", icon: UIImage(named:"check"), backgroundColor: .green , callback: { (sender: MGSwipeTableCell!) in
                        self.MessagerAlert(mitTitel: "Done")
                        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id as Any)
                        return true
                    })
                    
                    let right2Button = MGSwipeButton(title: "", icon: UIImage(named:"more"), backgroundColor: UIColor.orange, callback: { (sender: MGSwipeTableCell!) in
                        self.MessagerAlert(mitTitel: "Deteil")
                        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id as Any)
                        return true
                    })
                    cell.rightSwipeSettings.transition = .rotate3D
                    
                    rightButton.setPadding(30)
                    cell.rightExpansion.buttonIndex = 0
                    cell.rightButtons = [rightButton,right2Button]
                    right2Button.setPadding(10)
                } else
                {
                    let fontSize: CGFloat = 14
                    let label = UILabel()
                    label.font = UIFont.systemFont(ofSize: fontSize)
                    label.textAlignment = .center
                    label.textColor = UIColor.black
                    label.backgroundColor = UIColor.red
                    // Add count to label and size to fit
                    label.text = "\("Missing time")"
                    label.sizeToFit()
                    // Adjust frame to be square for single digits or elliptical for numbers > 9
                    var frame: CGRect = label.frame
                    frame.size.height += CGFloat(Int(0.4 * fontSize))
                    frame.size.width = (15 <= 9) ? frame.size.height : frame.size.width + CGFloat(Int(fontSize))
                    label.frame = frame
                    // Set radius and clip to bounds
                    label.layer.cornerRadius = frame.size.height / 2.0
                    label.clipsToBounds = true
                    // Show label in accessory view and remove disclosure
                    cell.accessoryView = label
                    cell.accessoryType = .none
                   
                    
                    let rightButton = MGSwipeButton(title: "", icon: UIImage(named:"more"), backgroundColor: UIColor.orange, callback: { (sender: MGSwipeTableCell!) in
                        self.MessagerAlert(mitTitel: "Deteil")
                        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id as Any)
                        return true
                    })
                    cell.rightSwipeSettings.transition = .rotate3D
                    
                    rightButton.setPadding(30)
                    cell.rightExpansion.buttonIndex = 0
                    cell.rightButtons = [rightButton]
                    rightButton.setPadding(10)
                }
            } else
            {
                let fontSize: CGFloat = 14
                let label = UILabel()
                label.font = UIFont.systemFont(ofSize: fontSize)
                label.textAlignment = .center
                label.textColor = UIColor.black
                label.backgroundColor = UIColor.green
                // Add count to label and size to fit
                label.text = "\("Completed")"
                label.sizeToFit()
                // Adjust frame to be square for single digits or elliptical for numbers > 9
                var frame: CGRect = label.frame
                frame.size.height += CGFloat(Int(0.4 * fontSize))
                frame.size.width = (15 <= 9) ? frame.size.height : frame.size.width + CGFloat(Int(fontSize))
                label.frame = frame
                // Set radius and clip to bounds
                label.layer.cornerRadius = frame.size.height / 2.0
                label.clipsToBounds = true
                // Show label in accessory view and remove disclosure
                cell.accessoryView = label
                cell.accessoryType = .none
                
                
                let rightButton = MGSwipeButton(title: "", icon: UIImage(named:"more"), backgroundColor: UIColor.orange, callback: { (sender: MGSwipeTableCell!) in
                    self.MessagerAlert(mitTitel: "Deteil")
                    print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id as Any)
                    return true
                })
                cell.rightSwipeSettings.transition = .rotate3D
                
                rightButton.setPadding(30)
                cell.rightExpansion.buttonIndex = 0
                cell.rightButtons = [rightButton]
                rightButton.setPadding(10)
            }

        
       
     
       // var test : String = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeEnd!
       
//        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeEnd as Any)
        
        cell.textLabel!.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).title
        cell.detailTextLabel!.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).userFrom
        
        
        //info
        /////////// custom
        
        
        return cell
    }
    func getTodayString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
      //  let hour = components.hour
      //  let minute = components.minute
       // let second = components.second
        
        let today_string = String(year!) + "-"  + String(month!) + "-" + "0" + String(day!) + "T" + "00"  + ":" + "00" + ":" +  "00"
        //2018-10-6 16T:59:11
        //2018-10-06T00:00:00
        return today_string
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

extension String {
    var lines: [String] {
        var result: [String] = []
        enumerateLines { line, _ in result.append(line) }
        return result
    }
}
