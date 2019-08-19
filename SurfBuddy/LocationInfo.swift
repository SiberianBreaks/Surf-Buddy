//
//  LocationInfo.swift
//  SurfBuddy
//
//  Created by John on 8/3/19.
//  Copyright © 2019 John. All rights reserved.
//

import Cocoa
import Alamofire
import SwiftyJSON

let decoder = JSONDecoder()
let getJSONUrl = "http://open.mapquestapi.com/geocoding/v1/address?key=cHCUo84eCtppNXRtex63AAAaptiAYdkq&location=Melbourne,FL"
let defaults = UserDefaults.standard
class LocationInfo: NSObject {
// Undone
    class func findHomeBreak(userInput:String) {
        let homeBreak = userInput.replacingOccurrences(of: " ", with: "+")
        print(homeBreak)
        print("test")
    }
    
// Load home break or detect if home break was previously entered
    class func newHomeBreak() {
        AF.request(getJSONUrl, method: .get).responseJSON{ (response) in
            let result = try! JSON(data: response.data!)
            let county = result["results"][0]["locations"][0]["adminArea4"].string!
            print(county)
            
        }
}
}
