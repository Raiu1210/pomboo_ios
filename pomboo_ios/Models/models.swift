//
//  models.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/29.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import Foundation


struct User : Codable {
    var email : String
    var password : String
}

struct Auth_result : Codable {
    var message : String
    var status  : Int
    var auth_id : Int
}
