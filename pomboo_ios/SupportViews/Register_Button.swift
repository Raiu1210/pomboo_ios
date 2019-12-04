//
//  Register_Button.swift
//  pomboo_ios
//
//  Created by raiu on 2019/12/04.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Register_Button: View {
    @Binding var email:String
    @Binding var password:String
    @Binding var password_check:String
    @Binding var user_name:String
    
    
    var body: some View {
        Button(action: {
            self.input_check()
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
    
    func input_check() {
        
    }
}

//struct Register_Button_Previews: PreviewProvider {
//    static var previews: some View {
//        Register_Button()
//    }
//}
