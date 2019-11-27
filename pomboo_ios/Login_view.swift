//
//  Login_view.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/21.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Login_view: View {

    @State var email: String = ""
    @State var password: String = ""
    @State var input_check: Bool = false
    
    var body: some View {
        ZStack {
            self.return_backGroundColor().edgesIgnoringSafeArea(.all)
            VStack (spacing: 30) {
                VStack (spacing: 0) {
                    HStack {
                        Text(" メールアドレス")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }.padding()
                    
                    TextField("  pomboo@xxx.com", text: $email)
                        .frame(width: 300.0, height: 50.0)
                        .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.15))
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                    
                    HStack {
                        Text("  パスワード")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }.padding()
                    
                    TextField("  password", text: $password)
                        .frame(width: 300.0, height: 50.0)
                        .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.15))
                        .font(.headline)
                }.padding()
                
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
                
                Spacer()
            }
        }
        .navigationBarTitle(Text("ログイン")
            .font(.title)
            .foregroundColor(Color.white)
        )
//        .navigationBarBackButtonHidden(true)
    }
    
    private func return_backGroundColor() -> LinearGradient {
        let MUM = My_UI_modules()

        return MUM.backGroundColor()
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
        if input_check {
            print("aborted")
            return
        }
        
        let user = User(email: email, password: password)
        let api = API()
        let test = api.login(user: user)
    }
}

struct Login_view_Previews: PreviewProvider {
    static var previews: some View {
        Login_view()
    }
}
