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
    let urlString = "http://192.168.128.104:3000"
    let APSD_path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    
    func login(user: User) -> Auth_result {
        // for sync
        let semaphore = DispatchSemaphore(value: 0)
        
        // initialize destination info and form
        let destination = urlString + "/login"
        let url = URL(string: destination)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var auth_result = Auth_result(
            message : "not response",
            status : -1,
            auth_id: -1,
            user_name: "none"
        )

        do {
            // create body
            let post_obj = try! encoder.encode(user)
            request.httpBody = post_obj
            
            // start session
            let task:URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data,response,error) -> Void in
                let tmp_auth_result = try! self.decoder.decode(Auth_result.self, from: data!)
                self.auth_handler(auth_result: tmp_auth_result, user:user)
                auth_result.message   = tmp_auth_result.message
                auth_result.status    = tmp_auth_result.status
                auth_result.auth_id   = tmp_auth_result.auth_id
                auth_result.user_name = tmp_auth_result.user_name
                semaphore.signal()
            })
            task.resume()
            semaphore.wait()
        } catch {
            print("Error:\(error)")
        }
        
        return auth_result
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
            } catch {
                //エラー処理
            }
        }
    }
    
    func is_my_info_valid() -> Auth_result {
        // when my_info exists, check it's valid or not
        
        let semaphore = DispatchSemaphore(value: 0)
        if (is_exist_my_info()) {
            var auth_result = Auth_result(
                message: "no",
                status: -1,
                auth_id: -1,
                user_name: "no")
            
            DispatchQueue.global().async {
                let my_info = self.load_my_info()
                auth_result = self.login(user: my_info)
                semaphore.signal()
            }
            semaphore.wait()
            print(auth_result)
            
            return auth_result
        }
        
        // if my_info.txt doesn't exist
        print("my_info doesn't exist")
        let no_exist = Auth_result(
            message: "my_info.txt doesn't exist",
            status: -1,
            auth_id: -1,
            user_name: "none"
        )
        
        return no_exist
    }
    
    func is_exist_my_info() -> Bool {
        // check my_info.txt exists or not in Application Support Dirctory
        if(FileManager.default.fileExists( atPath: self.APSD_path +  "/my_info.txt")) {
            print("ファイルあり")
            return true
        } else {
            print("ファイルなし")
            return false
        }
    }
    
    func load_my_info() -> User {
        let file_Name = "/my_info.txt"
        let file_path = self.APSD_path + file_Name
        let file_url = NSURL(fileURLWithPath: file_path)
        
        do {
            let jsonString = try String(contentsOf: file_url as URL, encoding: String.Encoding.utf8)
            let jsonData = jsonString.data(using: .utf8)!
            let my_info = try! JSONDecoder().decode(User.self, from: jsonData)
            
            return my_info
        } catch {
            print("aborted")
        }
        
        
        // when info.txt doesn't exist
        let no_info = User(
            email: "not found",
            password: "not found"
        )
        return no_info
    }
    
    
    func register(register_info:Register_info) -> Register_result {
        // for sync
        let semaphore = DispatchSemaphore(value: 0)
        
        // initialize destination info and form
        let destination = urlString + "/registration"
        let url = URL(string: destination)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var registeration_result = Register_result(
            message: "not response",
            status: -1,
            user_id: -1,
            user_name: "air man"
        )
        
        do {
            // create body
            let post_obj = try! encoder.encode(register_info)
            request.httpBody = post_obj
            
            // start session
            let task:URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data,response,error) -> Void in
                let tmp_registration_result = try! self.decoder.decode(Register_result.self, from: data!)
//                self.auth_handler(auth_result: tmp_auth_result, user:user)
                registeration_result.message   = tmp_registration_result.message
                registeration_result.status    = tmp_registration_result.status
                registeration_result.user_id   = tmp_registration_result.user_id
                registeration_result.user_name = tmp_registration_result.user_name
                semaphore.signal()
            })
            task.resume()
            semaphore.wait()
        } catch {
            print("Error:\(error)")
        }
        
        return registeration_result
    }
    
    
    func get_friend_location() {
        // for sync
        let semaphore = DispatchSemaphore(value: 0)
        
        let destination = urlString + "/get_frined_location"
        let url = URL(string: destination)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // prepare for user auth
        let user = load_my_info()
        print(user)
        
        do {
            // create body
            let post_obj = try! encoder.encode(user)
            request.httpBody = post_obj

            // start session
            let task:URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data,response,error) -> Void in
                let result = try! self.decoder.decode(Frineds_locations.self, from: data!)

                print(result)
                semaphore.signal()
            })
            task.resume()
            semaphore.wait()
        } catch {
            print("Error:\(error)")
        }
    }
}

