//
//  Register_Button.swift
//  pomboo_ios
//
//  Created by raiu on 2019/12/04.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Register_Button: View {
    var email:String
    var password:String
    var password_check:String
    var user_name:String
    
    @Binding var user_id: Int
    @Binding var is_registered: Bool
    
    @State var input_check: Bool = false
    
    var body: some View {
        Button(action: {
            self.check_input()
            self.post_register_info()
        }) {
            Text("登録")
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
        if password_check == "" {
            input_check = true
        }
        if user_name == "" {
            input_check = true
        }
    }
    
    func post_register_info() {
        if (input_check) {
            print("aborted")
            return
        }
        
        let register_info = Register_info(email: email, password: password, user_name: user_name)
        let api = API()
        let register_result = api.register(register_info: register_info)
        
        if (register_result.status == 0) {
            self.is_registered = true
            self.user_id = register_result.user_id
        }
        
        print(register_result)
    }
}

//struct Register_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Register_Button()
//    }
//}
