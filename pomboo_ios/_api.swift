//
//  _api.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/23.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import Foundation


class API {
    let urlString = "http://192.168.11.17:3000"
    let APSD_path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func login(user: User) {
        // initialize destination info and form
        let destination = urlString + "/login"
        let url = URL(string: destination)!
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            // create body
            let post_obj = try! encoder.encode(user)
            request.httpBody = post_obj
            
            // start session
            let task:URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data,response,error) -> Void in
                let resultData = String(data: data!, encoding: .utf8)!
                let dec_data = try! self.decoder.decode(Auth_result.self, from: data!)
                print(dec_data.message)
                print(dec_data.status)
                print(dec_data.auth_id)
            })
            task.resume()
        } catch {
            print("Error:\(error)")
            return
        }
    
            
//            do {
//                let file_path = APSD_path + "/user_info.txt"
//                let user_info = try! encoder.encode(user)
//                let user_info_str:String = String(data: user_info, encoding: .utf8)!
//                try user_info_str.write(toFile: file_path, atomically: false, encoding: String.Encoding.utf8)
//                print("Success")
//
//                print("Inside file is here")
//                let file_url = NSURL(fileURLWithPath: file_path)
//                let jsonString = try String(contentsOf: file_url as URL, encoding: String.Encoding.utf8)
//                print(jsonString)
//            } catch {
//                print("Error:\(error)")
//                return
//            }
//

        }
}


struct User : Codable {
    var email : String
    var password : String
}

struct Auth_result : Codable {
    var message : String
    var status  : Int
    var auth_id : Int
}
