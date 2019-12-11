//
//  Home.swift
//  pomboo_ios
//
//  Created by raiu on 2019/12/03.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Home: View {
    let user_id:Int
    let user_name:String
    
    var body: some View {
        VStack {
            Text("Home")
            Text("user_id : \(user_id)")
            Text("display name : \(user_name)")
        }
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home(user_id: -1, user_name:"raiu")
//    }
//}
