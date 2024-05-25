//
//  Fonts.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 16/05/24.
//

import Foundation
import UIKit
import SwiftUI

struct Fonts {
    struct Name {
        static let Inter_Black = "Inter-Black"
        static let Inter_Bold = "Inter-Bold"
        static let Inter_ExtraBold = "Inter-ExtraBold"
        static let Inter_ExtraLight = "Inter-ExtraLight"
        static let Inter_Light = "Inter-Light"
        static let Inter_Medium = "Inter-Medium"
        static let Inter_Regular = "Inter-Regular"
        static let Inter_SemiBold = "Inter-SemiBold"
        static let Inter_Thin = "Inter-Thin"
    }
    
  
}

extension Font {
    static let Title_X = Font.custom(Fonts.Name.Inter_Bold, size: 64.0)
    static let Title_1 = Font.custom(Fonts.Name.Inter_Bold, size: 32.0)
    static let Title_2 = Font.custom(Fonts.Name.Inter_SemiBold, size: 24.0)
    static let Title_3 = Font.custom(Fonts.Name.Inter_SemiBold, size: 18.0)
    static let Regular_1 = Font.custom(Fonts.Name.Inter_Medium, size: 16.0)
    static let Regular_2 = Font.custom(Fonts.Name.Inter_SemiBold, size: 16.0)
    static let Regular_3 = Font.custom(Fonts.Name.Inter_Medium, size: 14.0)
    static let Small = Font.custom(Fonts.Name.Inter_Medium, size: 13.0)
    static let Tiny = Font.custom(Fonts.Name.Inter_Medium, size: 12.0)
}
