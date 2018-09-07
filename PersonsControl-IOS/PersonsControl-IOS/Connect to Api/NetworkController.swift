//
//  NetworkController.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 05.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation

class GoogleSingInApiPOST: NSObject, URLSessionDelegate
{
    static  func GoogleSingIn(email:String,phone:String,name:String)  -> (String, String,String)
    {
        var resultDictonary:NSDictionary?
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue(name, forKey: "displayName")
        jsonDictionary.setValue(email, forKey: "email")
        jsonDictionary.setValue(phone, forKey: "phone")
       
        // prepare json data
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary)
        let configuration = URLSessionConfiguration.default
        // create post request
        let url = URL(string: "https://178.209.88.110/api/Users/GoogleSignIn")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        request.httpBody = jsonData
        let session = URLSession(configuration: configuration, delegate: GoogleSingInApiPOST(), delegateQueue: nil)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                resultDictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as NSDictionary?
                
                if let myDictionary = resultDictonary
                {
                    print(" code: \(myDictionary["code"]!)")
                    print(" message: \(myDictionary["message"]!)")
                    print(" time: \(myDictionary["time"]!)")
                    
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
//
//
        return (email,phone,name)
    }//GoogleSingIn
    
    static func SingIn(email:String,password:String)  -> (String, String)
    {
        //        https://178.209.88.110:443/api/RestApiHelper/helpinfo
        //    https://jsonplaceholder.typicode.com/todos/1
        
        var resultDictonary:NSDictionary?
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue(email, forKey: "email")
        jsonDictionary.setValue(password, forKey: "password")
        // prepare json data
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary)
        
        // create post request
        
        
        
        
        let configuration = URLSessionConfiguration.default
        let url = URL(string: "https://178.209.88.110:443/api/Users/SignIn")! //change the url
        var urlRequest: URLRequest = URLRequest(url: url)
        
        
        urlRequest.httpMethod = "POST"
        
        // insert json data to the request
        
        urlRequest.addValue("application/json",forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData

        let session = URLSession(configuration: configuration, delegate: GoogleSingInApiPOST(), delegateQueue: nil)
        let task = session.dataTask(with: urlRequest as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
//                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                    print(json)
//                }
//                let json = try? JSONDecoder().decode(JSONData.self, from: data)
                resultDictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as NSDictionary?
                
                if let myDictionary = resultDictonary
                {
                    print(" code: \(myDictionary["code"]!)")
                    print(" message: \(myDictionary["message"]!)")
                    print(" time: \(myDictionary["time"]!)")
                    
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
        return (email,password)
    }//SingIn
    
    
    static func RestApiHelper()  {
        //        https://178.209.88.110:443/api/RestApiHelper/helpinfo
        //    https://jsonplaceholder.typicode.com/todos/1
        
        
        
        let configuration = URLSessionConfiguration.default
        let url = URL(string: "https://178.209.88.110:443/api/RestApiHelper/helpinfo")! //change the url
        let urlRequest: NSURLRequest = NSURLRequest(url: url)
        let session = URLSession(configuration: configuration, delegate: GoogleSingInApiPOST(), delegateQueue: nil)
        let task = session.dataTask(with: urlRequest as URLRequest, completionHandler: { data, response, error in
            
                                guard error == nil else {
                                    print(error)
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
    }
    
    
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
                let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
                completionHandler(.useCredential, urlCredential)
            }
}


