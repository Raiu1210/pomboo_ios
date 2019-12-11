//
//  User_Tab_View.swift
//  pomboo_ios
//
//  Created by raiu on 2019/12/10.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct User_Tab_View: View {
    let user_id:Int
    let user_name:String
    
    var body: some View {
        TabView {
            Home(user_id: user_id, user_name: user_name)
                .tabItem {
                    Image(systemName: "house")
                }
            
            Text("Search friend")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Notification")
                .tabItem{
                    Image(systemName: "bell")
                }
            
            Text("Setting")
                .tabItem {
                    Image(systemName: "gear")
                }
        }
        .font(.title)
    }
}

//struct User_Tab_View_Previews: PreviewProvider {
//    static var previews: some View {
//        User_Tab_View()
//    }
//}
