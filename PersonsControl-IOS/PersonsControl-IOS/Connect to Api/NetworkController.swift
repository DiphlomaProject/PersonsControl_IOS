//
//  NetworkController.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 05.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation

class GoogleSingInApiPOST
{
   class  func GoogleSingInApiConnect(email:String,phone:String,name:String)  -> (String, String,String)
    {
//        challenge.sender.rejectProtectionSpaceAndContinue(with: challenge)
       
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue(email, forKey: "email")
        jsonDictionary.setValue(phone, forKey: "phone")
        jsonDictionary.setValue(name, forKey: "displayName")
        // prepare json data
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary)
        
        // create post request
        let url = URL(string: "https://178.209.88.110/api/Users/GoogleSignIn")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        
        task.resume()
        
       
        return (email,phone,name)
    }
    
   class func RestApiHelper()  {
//        https://178.209.88.110:443/api/RestApiHelper/helpinfo
//    https://jsonplaceholder.typicode.com/todos/1
        //create the url with NSURL
        let url = URL(string: "https://178.209.88.110:443/api/RestApiHelper/helpinfo")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        let request = URLRequest(url: url)
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
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
}
