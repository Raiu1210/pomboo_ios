//
//  Home.swift
//  pomboo_ios
//
//  Created by raiu on 2019/12/03.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Home: View {
    let user_id:Int
    let user_name:String
    
    var body: some View {
        TabView {
            VStack {
                Text("This is Home")
                Text("Your ID : \(user_id)")
                Text("Hello : \(user_name)")
            }
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .font(.headline)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(user_id: -1, user_name:"raiu")
    }
}
