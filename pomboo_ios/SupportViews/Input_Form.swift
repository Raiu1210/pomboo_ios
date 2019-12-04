//
//  Input_Form.swift
//  pomboo_ios
//
//  Created by raiu on 2019/12/04.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Input_Form: View {
    var guide_text:String
    var place_holder:String
    @Binding var binder:String
    
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Text(guide_text)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                Spacer()
            }.padding()
            
            TextField(place_holder, text: $binder)
                .frame(width: 300.0, height: 50.0)
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.15))
                .font(.headline)
        }
        
    }
}

//struct Input_Form_Previews: PreviewProvider {
//    static var previews: some View {
//        Input_Form()
//    }
//}
