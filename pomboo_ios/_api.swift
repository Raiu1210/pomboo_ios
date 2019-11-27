//
//  _api.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/23.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import Foundation
import UIKit


class API {
    let urlString = "http://192.168.11.17:3000"
    let APSD_path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func login(user: User) {
        // initialize destination info and form
        let destination = urlString + "/login"
        let url = URL(string: destination)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            // create body
            let post_obj = try! encoder.encode(user)
            request.httpBody = post_obj
            
            // start session
            let task:URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data,response,error) -> Void in
                let auth_result = try! self.decoder.decode(Auth_result.self, from: data!)
                self.auth_handler(auth_result: auth_result, user:user)
            })
            task.resume()
        } catch {
            print("Error:\(error)")
            return
        }
    }
    
    private func auth_handler(auth_result:Auth_result, user:User) {
        if (auth_result.status == 0) {
            // when auth succeeded, save its data to APSD dir as my_info.txt
            let file_Name = "/my_info.txt"
            let file_path = self.APSD_path + file_Name
            
            // process my_info to save
            let my_info = try! encoder.encode(user)
            let my_info_str:String = String(data: my_info, encoding: .utf8)!
            do {
                try my_info_str.write(toFile: file_path, atomically: false, encoding: String.Encoding.utf8)
                print("wrote file")
                
                print("Inside file is here")
                let file_url = NSURL(fileURLWithPath: file_path)
                let jsonString = try String(contentsOf: file_url as URL, encoding: String.Encoding.utf8)
                print(jsonString)
            } catch {
                //エラー処理
            }
        }
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
