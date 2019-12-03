//
//  Input_Field.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/29.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Input_Field: View {
    var place_holder = ""
    @Binding var binder: String
    
    var body: some View {
        TextField(place_holder, text: $binder)
            .frame(width: 300.0, height: 50.0)
            .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.15))
            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
    }
}

//struct Input_Field_Previews: PreviewProvider {
//    static var previews: some View {
//        Input_Field(place_holder:"", binder: <#Binding<String>#>)
//    }
//}
