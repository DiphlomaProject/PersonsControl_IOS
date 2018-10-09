//
//  TableViewController.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/5/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit
import SideMenu
import Foundation
class MyTaskVC: UITableViewController,MGSwipeTableCellDelegate {
 

    
    var today : String!
    var valueToPass : String!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       // today = getTodayString()
        //SingletonManager.sharedCenter.time = today
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
                refreshControl.addTarget(self, action: #selector(MyTaskVC.actualData(_:)), for: .valueChanged)
               // refreshControl.tintColor = UIColor.white
                return refreshControl
                
        }()
        
        
        tableView.rowHeight = 66
        
        
        customActivityIndicatory(self.view, startAnimate: false)
        LoadingNewData()
        tableView.addSubview(self.refreshControl!)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.ReloadData()
        tableView.addSubview(self.refreshControl!)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let detailVC: MyTaskDetailVC? = segue.destination as? MyTaskDetailVC
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
//            detailVC?.LoadData(label: self.valueToPass)
//        }
//}
    
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
        let selelectrow : Int = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id!
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyTaskDetailVC") as! MyTaskDetailVC
        valueToPass = String (selelectrow)
        newViewController.contentText = valueToPass
        self.show(newViewController, sender: nil)
        print(valueToPass)
       
    }
    
   
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PresonalTask", for: indexPath) as! MGSwipeTableCell
        let key =  SingletonManager.sharedCenter.contentPersonalTask.allKeys[indexPath.row]
        
        
       
       
        //2018-10-6 16T:59:11
        //2018-10-06T00:00:00
      //  print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeEnd as Any)
     //   print("time" + SingletonManager.sharedCenter.time)
        
        let dateString : String = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeEnd as Any as! String // change to your date format
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        dateFormatter.timeZone = TimeZone.init(abbreviation: "UTC")
        let dateTask = dateFormatter.date(from: dateString)
    
      //  print(dateTask as Any)
        
//
//        let dateCurrent =  Date()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
//     //   dateFormatter.timeZone = TimeZone.init(abbreviation: "GSM")
//        dateFormatter.timeZone = TimeZone.current
//        let dateNow = dateFormatter.string(from: dateCurrent)
//        //let datecurrent = dateFormatter.date(from: dateNow)
      
        
        let dateFormatter2 : DateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter2.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        let date = Date()
        let dateString2 = dateFormatter.string(from: date)
        let datecurrent = dateFormatter.date(from: dateString2)
        //print(datecurrent)
        //let interval = date.timeIntervalSince1970
       
            if((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).isComplite?.description == "false")
            {
                switch datecurrent!.compare(dateTask!) {
                case .orderedAscending:
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
                        //  self.MessagerAlert(mitTitel: "Deteil")
                        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id as Any)
                        let selelectrow : Int = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id!
                        
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyTaskDetailVC") as! MyTaskDetailVC
                        self.valueToPass = String (selelectrow)
                        newViewController.contentText = self.valueToPass
                        self.show(newViewController, sender: nil)
                        return true
                    })
                    cell.rightSwipeSettings.transition = .rotate3D
                    
                    rightButton.setPadding(30)
                    cell.rightExpansion.buttonIndex = 0
                    cell.rightButtons = [rightButton,right2Button]
                    right2Button.setPadding(10)
                    break
                    
                case .orderedDescending:
                    
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
                        // self.MessagerAlert(mitTitel: "Deteil")
                        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id as Any)
                        
                        let selelectrow : Int = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id!
                        
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyTaskDetailVC") as! MyTaskDetailVC
                        self.valueToPass = String (selelectrow)
                        newViewController.contentText = self.valueToPass
                        self.show(newViewController, sender: nil)
                        return true
                    })
                    cell.rightSwipeSettings.transition = .rotate3D
                    
                    rightButton.setPadding(30)
                    cell.rightExpansion.buttonIndex = 0
                    cell.rightButtons = [rightButton]
                    rightButton.setPadding(10)
                    print("POTRACHENO")
                    break
                    
                    
                case .orderedSame:
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
                        //  self.MessagerAlert(mitTitel: "Deteil")
                        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id as Any)
                        let selelectrow : Int = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id!
                        
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyTaskDetailVC") as! MyTaskDetailVC
                        self.valueToPass = String (selelectrow)
                        newViewController.contentText = self.valueToPass
                        self.show(newViewController, sender: nil)
                        return true
                    })
                    cell.rightSwipeSettings.transition = .rotate3D
                    
                    rightButton.setPadding(30)
                    cell.rightExpansion.buttonIndex = 0
                    cell.rightButtons = [rightButton,right2Button]
                    right2Button.setPadding(10)
                    break
                }
                
                
            }
            else
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
                   // self.MessagerAlert(mitTitel: "Deteil")
                    print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id as Any)
                    
                    let selelectrow : Int = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).id!
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyTaskDetailVC") as! MyTaskDetailVC
                    self.valueToPass = String (selelectrow)
                    newViewController.contentText = self.valueToPass
                    self.show(newViewController, sender: nil)
                    return true
                })
                cell.rightSwipeSettings.transition = .rotate3D
                
                rightButton.setPadding(30)
                cell.rightExpansion.buttonIndex = 0
                cell.rightButtons = [rightButton]
                rightButton.setPadding(10)
            }
        print((SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).dateTimeEnd as Any)
        
        cell.textLabel!.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).title
        cell.detailTextLabel!.text = (SingletonManager.sharedCenter.contentPersonalTask.object(forKey: key) as! UserTask).userFrom
//        let newLabel = UILabel(frame: CGRect(x: 0, y: 14.0, width: 300.0, height: 30.0))
//        newLabel.text = "tesxt"
//        newLabel.tag = 1
//        cell.addSubview(newLabel)
        
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
    
    
    @discardableResult
    func customActivityIndicatory(_ viewContainer: UIView, startAnimate:Bool? = true) -> UIActivityIndicatorView {
        let mainContainer: UIView = UIView(frame: viewContainer.frame)
        mainContainer.center = viewContainer.center
        mainContainer.backgroundColor = UIColor.init(hexString: "#007AFF")
        
        mainContainer.alpha = 0.5
        mainContainer.tag = 789456123
        mainContainer.isUserInteractionEnabled = false
        
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x:0,y: 0,width: 80,height: 80))
        viewBackgroundLoading.center = viewContainer.center
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
