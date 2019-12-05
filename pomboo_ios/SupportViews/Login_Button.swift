//
//  Login_Button.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/29.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Login_Button: View {
    var email: String = ""
    var password: String = ""
    
    @Binding var auth_id: Int
    @Binding var is_authed: Bool
    @Binding var user_name: String
    
    @State var input_check: Bool = false
    
    
    var body: some View {
        Button(action: {
            self.check_input()
            self.post_data()
        }) {
            Text("ログイン")
                .font(.headline)
                .foregroundColor(Color.blue)
                .frame(width: 200.0, height: 50)
                .background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/)
                .cornerRadius(20.0)
                .shadow(radius: 20)
        }
    }
    
    func check_input() {
        if email == "" {
            input_check = true
        }
        if password == "" {
            input_check = true
        }
    }
    
    func post_data() {
        if (input_check) {
            print("aborted")
            return
        }
        
        let user = User(email: email, password: password)
        let api = API()
        let auth_result = api.login(user: user)
        
        print(auth_result)
        
        if (auth_result.status == 0) {
            self.auth_id = auth_result.auth_id
            self.is_authed = true
            self.user_name = auth_result.user_name
        }
    }
}

//struct Login_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Login_Button(email: "baio1484@gmail.com", password: "oppai")
//    }
//}

