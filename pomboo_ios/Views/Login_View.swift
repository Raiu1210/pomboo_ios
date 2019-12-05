//
//  Login_view.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/21.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Login_View: View {

    @State var email:String = ""
    @State var password:String = ""
    @State var is_authed:Bool = false
    @State var auth_id:Int = 0
    @State var user_name:String = ""
    
    var body: some View {
        switch is_authed {
        case true:
            return AnyView(Home(my_id: auth_id, user_name: user_name))
        default:
            return AnyView(Login_form(email: $email, password: $password, is_authed: $is_authed, auth_id: $auth_id, user_name: $user_name))
        }
    }

}


struct Login_form: View {
    @Binding var email:String
    @Binding var password:String
    @Binding var is_authed:Bool
    @Binding var auth_id:Int
    @Binding var user_name:String
    
    
    var body: some View {
        ZStack {
            self.return_backGroundColor().edgesIgnoringSafeArea(.all)
            VStack (spacing: 30) {
                VStack (spacing: 0) {
                    Input_Form(guide_text: " メールアドレス", place_holder: " xxxyyyzzz@pomboo.com", binder: $email)
                    Input_Form(guide_text: "  パスワード", place_holder: "  password", binder: $password)
                }.padding()

                Login_Button(email:email, password:password, auth_id:$auth_id , is_authed:$is_authed, user_name: $user_name)
                Spacer()
            }
        }
    }
    
    private func return_backGroundColor() -> LinearGradient {
        let MUM = My_UI_modules()
        return MUM.backGroundColor()
    }
}



//struct Login_view_Previews: PreviewProvider {
//    static var previews: some View {
//        Login_view()
//    }
//}

