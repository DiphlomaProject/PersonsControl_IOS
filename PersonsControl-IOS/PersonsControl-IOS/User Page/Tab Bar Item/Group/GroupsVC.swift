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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceApiPost.GetGroupsUser(Complete: { (success, loginError) in
            if success {
                
               
            

//      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).title ?? "error" )
//      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).desc ?? "error" )
//      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).ownerInfo?.displayName ?? "error" )
                for key in SingletonManager.sharedCenter.contentGroup
                {

                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).title ?? "error" )


                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).desc ?? "error" )
                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).ownerInfo?.displayName ?? "error" )
                    }
//
                
                 self.ReloadData()
 
            } else {
                DispatchQueue.main.async {
                    
                    
                }
            }
        })
      
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.ReloadData()
        
       
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

//        for value in SingletonManager.sharedCenter.contentGroup
//        {
//
//            cell.title.text = ((SingletonManager.sharedCenter.contentGroup.object(forKey: value.key) as! Group).title ?? "error" )
//            cell.owner.text = ((SingletonManager.sharedCenter.contentGroup.object(forKey: value.key) as! Group).ownerInfo?.displayName ?? "error" )
//            cell.desc.text = ((SingletonManager.sharedCenter.contentGroup.object(forKey: value.key) as! Group).desc ?? "error" )
//
//            return cell
//        }
        
       
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
    }

