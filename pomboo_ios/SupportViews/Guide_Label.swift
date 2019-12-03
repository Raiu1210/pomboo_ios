//
//  Guide_Label.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/29.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import SwiftUI

struct Guide_Label: View {
    var label_text : String
        
    
    var body: some View {
        Text(label_text)
            .font(.headline)
            .foregroundColor(Color.white)
            .multilineTextAlignment(.leading)
    }
}

struct Guide_Label_Previews: PreviewProvider {
    static var previews: some View {
        Guide_Label(label_text: "Hello")
    }
}
