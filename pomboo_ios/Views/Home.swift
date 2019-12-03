//
//  Home.swift
//  pomboo_ios
//
//  Created by raiu on 2019/12/03.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Home: View {
    let my_id:Int
    
    var body: some View {
        VStack {
            Text("This is Home")
            Text("Your ID : \(my_id)")
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(my_id: -1)
    }
}
