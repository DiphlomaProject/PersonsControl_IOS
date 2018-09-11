//
//  SingletonManager.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 14.08.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
class SingletonManager {

    
    // Can't init is singleton
    private init() {
        
    }
    
    // MARK: Shared Instance
    
   static let sharedCenter = SingletonManager()
    
    //json
    var code : Int = 0
    var message = ""
    var token = ""
    var time = ""
    //data
    var RoleNames = ""
    var img = ""
    var Claims = ""
    var Address = ""
    var Country = ""
    var City = ""
    var DisplayName = ""
    var Email = ""
    var EmailConfirmed = ""
    var PhoneNumber = ""
    var Id = ""
    var UserName = ""
        //logins
    var LoginProvider = ""
    var ProviderKey = ""
    var UserIDLogin = ""
        //roles
    var UserIdRoles = ""
    var RoleIdRoles = ""
    
    
    var UserClass : User?
   


    
    

    // Configurations Microsoft Identity
    let AUTHORITY_URL = "https://login.microsoftonline.com/common/oauth2/nativeclient" //COMMON OR YOUR TENANT ID
    let CLIENT_ID = "a4b7974c-4a7c-475e-91b8-a82d67b0d9a8" //This is your client ID
    let REDIRECT_URI = "urn:ietf:wg:oauth:2.0:oob" //This is your redirect URI
    
  
    
    
    
}


/*static func PostSearchOffers(
    offerType: OfferType,
    searchParams: newOfferTemplate,
    success: @escaping(OfferSearchResult?) -> Void,
    failure: @escaping(CError?) -> Void) {
    
    let url:String = "offers/search"
    //searchParams.type = offerType
    print(searchParams.toJsonCustom())
    var json = searchParams.toJsonCustom()
    json.removeValue(forKey: "id")
    json.removeValue(forKey: "name")
    //json.removeValue(forKey: "type")
    //json.removeValue(forKey: "page")
    Network.manager.request(URL(string: url.baseUrl())!,
                            method: .post,
                            parameters: json,
                            encoding: JSONEncoding.default)
        
        
        .responseObject(completionHandler: { (response: DataResponse<OfferSearchResult>) in
            
            if ( response.result.isSuccess && response.value?.apiError == nil ){
                success(response.value)
            }
            else{
                let error = CError(nsError: response.result.error, apiError: response.value?.apiError)
                Network.handleApiError(error: error)
                failure(error)
            }
        })
}

SearchRequests.PostSearchOffers(offerType: (modeForCell == 0 ? OfferType.Cargo : OfferType.Truck), searchParams: newOfferTempl!/*OfferSearchRequest()*/, success: {(response) in
    if response != nil {
        self.offerResultByFilterId = response
        self.navigationItem.title = "results".localized() + (self.offerResultByFilterId?.quantity?.toString() ?? "")!
        
        self.tableView.reloadNoScroll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            CGProgressHUD.showTaskCompleted()
        }
    }else {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            CGProgressHUD.showTaskCompleted()
        }
    }
}, failure: {(error) in
    print("getSearchResult error :", error ?? "OOOOOO NEEEEEETTTTT.")
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        CGProgressHUD.showTaskCompleted()
    }
} )
 */
/*
NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
    var err: NSError
    var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
    println("Asynchronous\(jsonResult)")
})
*/
