//
//  Welcome_view.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/21.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Welcome_view: View {
    var body: some View {
        ZStack {
            self.return_backGroundColor().edgesIgnoringSafeArea(.all)
            VStack (spacing: 60){
                Text("ようこそ pombooへ")
                    .font(.title)
                    .foregroundColor(Color.white)

                VStack (spacing: 10) {
                    NavigationLink(destination: Login_view()) {
                        Text("ログイン")
                            .font(.headline)
                            .foregroundColor(Color.blue)
                            .frame(width: 200.0, height: 50)
                        .background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20.0)
                        .shadow(radius: 20)
                    }

                    Text("または")
                        .foregroundColor(Color.white)
                    
                    NavigationLink(destination: SignUp_view()) {
                        Text("登録")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        .frame(width: 200.0, height: 50)
                        .cornerRadius(20.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    }
                }.padding(70)
            }
        }
    }
    
    private func return_backGroundColor() -> LinearGradient {
        let MUM = My_UI_modules()

        return MUM.backGroundColor()
    }
}

struct Welcome_view_Previews: PreviewProvider {
    static var previews: some View {
        Welcome_view()
    }
}
