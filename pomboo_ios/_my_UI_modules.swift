//
//  _my_UI_modules.swift
//  pomboo_ios
//
//  Created by raiu on 2019/11/22.
//  Copyright © 2019 Ryu Ishibashi. All rights reserved.
//

import Foundation
import SwiftUI


class My_UI_modules {
    func backGroundColor() -> LinearGradient {
        let start = UnitPoint.init(x: 0.0, y: 0.0)
        let end = UnitPoint.init(x: 1.0, y: 1.0)

        // convert UIColor to Color
        let colors = Gradient(colors: [Color(red: 0.0, green: 0.8, blue: 0.8), Color.blue])
        let gradientColor = LinearGradient(gradient: colors, startPoint: start, endPoint: end)

        return gradientColor
    }
}
