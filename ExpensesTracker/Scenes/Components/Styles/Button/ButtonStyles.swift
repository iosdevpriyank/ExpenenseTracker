//
//  ButtonStyles.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 17/05/24.
//

import Foundation
import SwiftUI

struct VioletButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.violet100)
            .foregroundColor(.white)
            .clipShape(.capsule)
            .font(Font.Title_3)
    }
    
    
}

struct LightVioletButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.violet20)
            .foregroundColor(Color.violet100)
            .clipShape(.capsule)
            .font(Font.Title_3)
    }
    
    
}
