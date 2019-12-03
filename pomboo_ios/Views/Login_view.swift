//
//  Login_view.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/21.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Login_view: View {

    @State var email:String = ""
    @State var password:String = ""
    @State var is_authed:Bool = false
    @State var auth_id:Int = 0
    
    var body: some View {
        ZStack {
            self.return_backGroundColor().edgesIgnoringSafeArea(.all)
            VStack (spacing: 30) {
                VStack (spacing: 0) {
                    HStack {
                        Guide_Label(label_text: " メールアドレス")
                        Spacer()
                    }.padding()
                    Input_Field(place_holder:" xxxyyyzzz@pomboo.com", binder: $email)
                    

                    HStack {
                        Guide_Label(label_text: "  パスワード")
                        Spacer()
                    }.padding()
                    Input_Field(place_holder:"  password", binder: $password)
                }.padding()
                
                Login_Button(email:email, password:password)
                Spacer()
            }
        }
        .navigationBarTitle(Text("ログイン")
            .font(.title)
            .foregroundColor(Color.white)
        )
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

