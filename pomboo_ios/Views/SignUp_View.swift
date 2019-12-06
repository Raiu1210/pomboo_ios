//
//  SignUp_view.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/21.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct SignUp_view: View {
    @State var email:String = ""
    @State var password:String = ""
    @State var password_check:String = ""
    @State var user_name:String = ""
    @State var user_id:Int = 0
    
    @State var is_registered:Bool = false
    
    var body: some View {
        switch is_registered {
        case true:
            return AnyView(Home(user_id:user_id, user_name:user_name)
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
            )
        default:
            return AnyView(Sign_UP_form(email: $email, password: $password, password_check: $password_check, user_name: $user_name, user_id: $user_id, is_registered: $is_registered))
        }
    }
}



struct Sign_UP_form: View {
    @Binding var email:String
    @Binding var password:String
    @Binding var password_check:String
    @Binding var user_name:String
    @Binding var user_id:Int
    
    @Binding var is_registered:Bool
    var body: some View {
        ZStack {
            self.return_backGroundColor().edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack(spacing: 50) {
                    VStack (spacing: 0) {
                        // 4 inputs: email address, password, password check, display name
                        Input_Form(guide_text: " メールアドレス", place_holder: " xxxyyyzzz@pomboo.com", binder: $email)
                        Input_Form(guide_text: "  パスワード", place_holder: "  password", binder: $password)
                        Input_Form(guide_text: "  パスワード（確認用）", place_holder: "  password", binder: $password_check)
                        Input_Form(guide_text: "  表示名", place_holder: "  らいう", binder: $user_name)
                    }.padding()
                    
                    Register_Button(email: email, password: password, password_check: password_check, user_name: user_name, user_id: $user_id, is_registered: $is_registered)
                    Spacer(minLength: 350)
                }
            }
        }
    }
    
    private func return_backGroundColor() -> LinearGradient {
        let MUM = My_UI_modules()
        return MUM.backGroundColor()
    }
}

//struct SignUp_view_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUp_view()
//    }
//}
