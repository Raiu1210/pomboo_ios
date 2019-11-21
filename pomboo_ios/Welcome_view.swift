//
//  Welcome_view.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/21.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Welcome_view: View {
    let backGroundColor = LinearGradient(gradient: Gradient(
        colors: [Color(red: 0.0, green: 0.85, blue: 1.0, opacity: 1.0),
                 Color.blue]),
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backGroundColor.edgesIgnoringSafeArea(.all)
            Text("This is welcome view")
        }
    }
}

struct Welcome_view_Previews: PreviewProvider {
    static var previews: some View {
        Welcome_view()
    }
}
