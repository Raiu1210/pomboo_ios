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
        NavigationView {
            ZStack {
                self.backGroundColor().edgesIgnoringSafeArea(.all)
                VStack (spacing: 80){
                    Text("welcome to pomboo!")
                        .font(.title)
                        .foregroundColor(Color.white)

                    VStack (spacing: 10) {
                        NavigationLink(destination: Login_view()) {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(Color.blue)
                                .frame(width: 200.0, height: 50)
                            .background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/)
                            .cornerRadius(20.0)
                            .shadow(radius: 20)
                        }

                        Text("or")
                            .foregroundColor(Color.white)
                        
                        NavigationLink(destination: SignUp_view()) {
                            Text("Sign Up")
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
    }
    
    private func backGroundColor() -> LinearGradient {
        let start = UnitPoint.init(x: 0.0, y: 0.0)
        let end = UnitPoint.init(x: 1.0, y: 1.0)

        // convert UIColor to Color
        let colors = Gradient(colors: [Color.blue, Color(UIColor.blue)])
        let gradientColor = LinearGradient(gradient: colors, startPoint: start, endPoint: end)

        return gradientColor
    }
}

struct Welcome_view_Previews: PreviewProvider {
    static var previews: some View {
        Welcome_view()
    }
}
