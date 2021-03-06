//
//  models.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/29.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import Foundation

// struct for login
// this is also used for getting friends location
struct User : Codable {
    var email : String
    var password : String
}

struct Auth_result : Codable {
    var message   : String
    var status    : Int
    var auth_id   : Int
    var user_name : String
}


// struct for register
struct Register_info : Codable {
    var email : String
    var password : String
    var user_name : String
}

struct Register_result : Codable {
    var message   : String
    var status    : Int
    var user_id   : Int
    var user_name : String
}


// struct for get_location
// curl -X POST -H "Content-Type: application/json" -d '{"email":"baio1484@gmail.com", "password":"oppai"}' localhost:3000/get_frined_location

struct Frineds_locations : Codable {
    var message : String
    var friend_locations : [User_location]
}

struct User_location : Codable {
    var user_id : Int
    var permission : Int
    var latitude : Double
    var longitude : Double
    var timestamp : String
}


