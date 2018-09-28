//
//  NetworkController.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 05.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
import UIKit
class ServiceApiPost: NSObject, URLSessionDelegate
{
   
    static  func SingIn(email:String,password:String,loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        let resultDictionary = NSMutableDictionary()
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue(email, forKey: "email")
        jsonDictionary.setValue(password, forKey: "password")
        // prepare json data
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary)
        // create post request
        let configuration = URLSessionConfiguration.default
        let url = URL(string: SingletonManager.sharedCenter.base_URL + SingletonManager.sharedCenter.SignIn_URL)! //change the url
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        // insert json data to the request
        urlRequest.addValue("application/json",forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        let session = URLSession(configuration: configuration, delegate: ServiceApiPost(), delegateQueue: nil)
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                loginComplete(false, error)
                return
            }
            
            guard let data = data else {
                loginComplete(false, error)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(SignIn_Base.self, from: data)
                DispatchQueue.main.async {
                    if(jsonData.token != nil)
                    {
                        resultDictionary.setValue(jsonData.data?.id, forKey: "Id")
                        resultDictionary.setValue(jsonData.token, forKey: "token")
                        resultDictionary.setValue(jsonData.data?.userName, forKey: "UserName")
                        resultDictionary.setValue(jsonData.data?.img, forKey: "img")
                        resultDictionary.setValue(jsonData.data?.displayName, forKey: "DisplayName")
                        resultDictionary.setValue(jsonData.data?.email, forKey: "Email")
                        resultDictionary.setValue(jsonData.data?.emailConfirmed, forKey: "EmailConfirmed")
                        resultDictionary.setValue(jsonData.data?.address, forKey: "Address")
                        resultDictionary.setValue(jsonData.data?.city, forKey: "City")
                        resultDictionary.setValue(jsonData.data?.country, forKey: "Country")
                        resultDictionary.setValue(jsonData.data?.phoneNumber, forKey: "PhoneNumber")
                        if(jsonData.data?.roleNames != nil && jsonData.data?.roleNames?.count ?? 0 > 0)
                        {
                             resultDictionary.setValue(jsonData.data?.roleNames![0], forKey: "RoleName")
                        }
                        SingletonManager.sharedCenter.UserClass = User.init(json: resultDictionary)
                        let encodedData = NSKeyedArchiver.archivedData(withRootObject: SingletonManager.sharedCenter.UserClass as Any)
                        UserDefaults.standard.set(encodedData, forKey: "User")
                       // UserDefaults.synchronize()
                       loginComplete(true, nil)
                    }
                    else if(jsonData.token == nil)
                    {
                        loginComplete(false, error)
                    }
                    
                }
            } catch let jsonError {
                loginComplete(false, error)
                print(jsonError)
            }
            }.resume()
        
    }//singIn
    
    
  static  func GoogleSingIn(email: String, phone: String,name: String,loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
    let resultDictionary = NSMutableDictionary()
    let jsonDictionary = NSMutableDictionary()
    jsonDictionary.setValue(name, forKey: "displayName")
    jsonDictionary.setValue(email, forKey: "email")
    jsonDictionary.setValue(phone, forKey: "phone")
    // prepare json data
    let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary)
    let configuration = URLSessionConfiguration.default
    // create post request
   
     let url = URL(string: SingletonManager.sharedCenter.base_URL + SingletonManager.sharedCenter.GoogleSignIn_URL)! //change the url
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    // insert json data to the request
    request.addValue("application/json",forHTTPHeaderField: "Accept")
    request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    
    request.httpBody = jsonData
    let session = URLSession(configuration: configuration, delegate: ServiceApiPost(), delegateQueue: nil)
    session.dataTask(with: request) { (data, response, error) in
        if error != nil {
            loginComplete(false, error)
            return
        }
        
        guard let data = data else {
            loginComplete(false, error)
            return
        }
        
        do {
            let jsonData = try JSONDecoder().decode(SignIn_Base.self, from: data)
            DispatchQueue.main.async {
                if(jsonData.token != nil)
                {
                    resultDictionary.setValue(jsonData.data?.id, forKey: "Id")
                    resultDictionary.setValue(jsonData.token, forKey: "token")
                    resultDictionary.setValue(jsonData.data?.userName, forKey: "UserName")
                    resultDictionary.setValue(jsonData.data?.img, forKey: "img")
                    resultDictionary.setValue(jsonData.data?.displayName, forKey: "DisplayName")
                    resultDictionary.setValue(jsonData.data?.email, forKey: "Email")
                    resultDictionary.setValue(jsonData.data?.emailConfirmed, forKey: "EmailConfirmed")
                    resultDictionary.setValue(jsonData.data?.address, forKey: "Address")
                    resultDictionary.setValue(jsonData.data?.city, forKey: "City")
                    resultDictionary.setValue(jsonData.data?.country, forKey: "Country")
                    resultDictionary.setValue(jsonData.data?.phoneNumber, forKey: "PhoneNumber")
                    if(jsonData.data?.roleNames != nil && jsonData.data?.roleNames?.count ?? 0 > 0)
                    {
                        resultDictionary.setValue(jsonData.data?.roleNames![0], forKey: "RoleName")
                    }
                    SingletonManager.sharedCenter.UserClass = User.init(json: resultDictionary)
                    let encodedData = NSKeyedArchiver.archivedData(withRootObject: SingletonManager.sharedCenter.UserClass as Any)
                    UserDefaults.standard.set(encodedData, forKey: "User")
                    // UserDefaults.synchronize()
                    loginComplete(true, nil)
                }
                else if(jsonData.token == nil)
                {
                    loginComplete(false, error)
                }
                
            }
        } catch let jsonError {
            loginComplete(false, error)
            print(jsonError)
        }
        }.resume()
    
    }//GoogleSignIn
    
    static func RestApiHelper()  {
        let configuration = URLSessionConfiguration.default
        let url = URL(string: SingletonManager.sharedCenter.HelpInfo_URL)! //change the url
        let urlRequest: NSURLRequest = NSURLRequest(url: url)
        let session = URLSession(configuration: configuration, delegate: ServiceApiPost(), delegateQueue: nil)
        let task = session.dataTask(with: urlRequest as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                print(error as Any)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
    }//RestApiHelper
    
    
    static  func SingUp(email:String,password:String,userName:String,phone:String,regComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
//        let resultDictionary = NSMutableDictionary()
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue(email, forKey: "email")
        jsonDictionary.setValue(password, forKey: "password")
        jsonDictionary.setValue(userName, forKey: "displayName")
        jsonDictionary.setValue(phone, forKey: "phone")         // prepare json data
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary)
        // create post request
        let configuration = URLSessionConfiguration.default
   
         let url = URL(string: SingletonManager.sharedCenter.base_URL + SingletonManager.sharedCenter.SignUp_URL)! //change the url
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        // insert json data to the request
        urlRequest.addValue("application/json",forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        let session = URLSession(configuration: configuration, delegate: ServiceApiPost(), delegateQueue: nil)
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                regComplete(false, error)
                return
            }
            
            guard let data = data else {
                regComplete(false, error)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(SignIn_Base.self, from: data)
                DispatchQueue.main.async {
                    print(jsonData)
                    regComplete(true, nil)
                    
                }
            } catch let jsonError {
                regComplete(false, error)
                print(jsonError)
            }
            }.resume()
        
    }//singUp
    
    
    
    static  func GetGroupsUser(Complete: @escaping (_ status: Bool, _ error: Error?) -> ()) {

        let token = SingletonManager.sharedCenter.UserClass?.token
        let idUser = SingletonManager.sharedCenter.UserClass?.id
        let resultDictionary = NSMutableDictionary()
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue(token, forKey: "token")
        jsonDictionary.setValue(idUser, forKey: "id")
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary)
        // create post request
        let configuration = URLSessionConfiguration.default
       
        let url = URL(string: SingletonManager.sharedCenter.base_URL + SingletonManager.sharedCenter.GetUserGroups_URL)! //change the url
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        // insert json data to the request
        urlRequest.addValue("application/json",forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        let session = URLSession(configuration: configuration, delegate: ServiceApiPost(), delegateQueue: nil)
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                Complete(false, error)
                return
            }
            
            guard let data = data else {
                Complete(false, error)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(Groups_Base.self, from: data)
                DispatchQueue.main.async {
                    print(jsonData)
                
                    resultDictionary.setValue(jsonData.groups_model?.groups, forKey: "groups")
                    resultDictionary.setValue(jsonData.groups_model?.owners, forKey: "owners")
                    
                   
  
                    Complete(true, nil)
                    
                }
            } catch let jsonError {
                Complete(false, error)
                print(jsonError)
            }
            }.resume()
    }//getgroups
    
    
    static  func GetImageUser(regComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        
        let user_email = SingletonManager.sharedCenter.UserClass?.Email
        let url = URL(string: SingletonManager.sharedCenter.base_URL + SingletonManager.sharedCenter.GetUserImg_URL + user_email!)! //change the url
        let configuration = URLSessionConfiguration.default
        //let url = URL(string: SingletonManager.sharedCenter.SignUp_URL)! //change the url
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("image/jpeg", forHTTPHeaderField: "Content-Type")
        let session = URLSession(configuration: configuration, delegate: ServiceApiPost(), delegateQueue: nil)
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                regComplete(false, error)
                return
            }
            
            guard let data = data else {
                regComplete(false, error)
                return
            }
            
            do {
                
                DispatchQueue.main.async {
                    //print(jsonData)
                    let image = UIImage(data: data)
                    SingletonManager.sharedCenter.ImageProfile = image
                    regComplete(true, nil)
                    
                }
            } catch let jsonError {
                regComplete(false, error)
                print(jsonError)
            }
            }.resume()
    }//getimege
    
    
    
  
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, urlCredential)
    }
}


