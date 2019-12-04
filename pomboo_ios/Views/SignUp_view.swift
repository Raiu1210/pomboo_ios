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
    
    var body: some View {
        ZStack {
            self.return_backGroundColor().edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack (spacing: 0) {
                    // 4 inputs
                    // 1. email address
                    Input_Form(guide_text: " メールアドレス", place_holder: " xxxyyyzzz@pomboo.com", binder: $email)
                    
                    // 2. password
                    Input_Form(guide_text: "  パスワード", place_holder: "  password", binder: $password)

                    // 3. password check
                    Input_Form(guide_text: "  パスワード（確認用）", place_holder: "  password", binder: $password_check)
                    
                    // 4. display name
                    Input_Form(guide_text: "  表示名", place_holder: "  らいう", binder: $user_name)
                    Spacer(minLength: 800)
                }.padding()
            }
            
        }
    }
    
    private func return_backGroundColor() -> LinearGradient {
        let MUM = My_UI_modules()

        return MUM.backGroundColor()
    }
}

struct SignUp_view_Previews: PreviewProvider {
    static var previews: some View {
        SignUp_view()
    }
}
