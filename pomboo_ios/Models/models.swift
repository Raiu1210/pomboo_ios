//
//  models.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/29.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import Foundation

// struct for login
struct User : Codable {
    var email : String
    var password : String
}

struct Auth_result : Codable {
    var message : String
    var status  : Int
    var auth_id : Int
}


// struct for register
struct Register_info : Codable {
    var email : String
    var password : String
    var user_name : String
}

struct Register_result : Codable {
    var message : String
    var user_id : Int
}
