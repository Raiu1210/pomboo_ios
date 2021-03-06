//
//  ContentView.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/12.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var auth_result:Auth_result
    
    var body: some View {
        NavigationView {
            if (auth_result.status == 0) {
                User_Tab_View(user_id: auth_result.auth_id, user_name: auth_result.user_name)
            } else {
                Welcome_View()
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
