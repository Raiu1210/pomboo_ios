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
            Text("This is Home")
            Text("Your ID : \(user_id)")
            Text("Hello : \(user_name)")
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(user_id: -1, user_name:"raiu")
    }
}
