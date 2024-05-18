//
//  AppTextFieldStyle.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 19/05/24.
//

import Foundation
import SwiftUI

struct DefaultAppTextFieldStyle: TextFieldStyle {

    func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.appColor40, lineWidth: 2.0)
                    .frame(height: 56)
            )
            .padding()
        }
    
    
}
