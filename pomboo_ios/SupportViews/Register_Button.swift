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
    
    @State var input_check: Bool = false
    
    var body: some View {
        Button(action: {
            self.check_input()
            
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
    
    func post_register_info(register_info:Register_info) {
        
    }
}

//struct Register_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Register_Button()
//    }
//}
