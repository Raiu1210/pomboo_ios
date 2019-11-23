//
//  Login_view.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/21.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Login_view: View {
    init(){
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
    }
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            self.return_backGroundColor().edgesIgnoringSafeArea(.all)
            VStack (spacing: 50) {
                HStack {
                    Text("Login")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 200.0, height: 30)
                    Spacer()
                }
                
                VStack(spacing: 20) {
                    TextField("email", text: $email)
                        .frame(width: 300.0, height: 50.0)
                        .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.25))
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                    
                    
                    TextField("password", text: $password)
                        .frame(width: 300.0, height: 50.0)
                        .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.25))
                        .font(.headline)
                        
                }
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
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
