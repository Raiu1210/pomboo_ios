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
        NavigationView {
            ZStack {
                self.return_backGroundColor().edgesIgnoringSafeArea(.all)
                VStack (alignment: .center, spacing: 30) {
                    TextField("email", text: $email)
                        .frame(width: 300.0, height: 50.0)
                        .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.25))
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                    
                    TextField("password", text: $password)
                    .frame(width: 300.0, height: 50.0)
                    .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.25))
                    .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }
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
