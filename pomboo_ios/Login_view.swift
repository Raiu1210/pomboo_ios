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
    
    var body: some View {
        ZStack {
            self.return_backGroundColor().edgesIgnoringSafeArea(.all)
            VStack (spacing: 30) {
                VStack (spacing: 0) {
                    HStack {
                        Text(" email")
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
                        Text("  password")
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
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Login")
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
        .navigationBarTitle("Login")
    }
    
    private func return_backGroundColor() -> LinearGradient {
        let MUM = My_UI_modules()

        return MUM.backGroundColor()
    }
}

struct Login_view_Previews: PreviewProvider {
    static var previews: some View {
        Login_view()
    }
}
