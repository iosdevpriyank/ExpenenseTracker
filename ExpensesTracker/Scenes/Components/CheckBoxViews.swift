//
//  CheckBoxViews.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 20/05/24.
//

import SwiftUI

struct CheckBoxViews: View {
    @Binding var isChecked: Bool
    let label: String
    let color: Color
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .font(.system(size: 30))
                .foregroundColor(color)
                .onTapGesture {
                    isChecked.toggle()
                }
            Text(.init(label))
                .font(Font.Regular_3)
        }
    }
}

#Preview {
    CheckBoxViews(isChecked: .constant(true), label: "By signing up, you agree to the **[Terms of Service and Privacy Policy](https://www.google.com)**", color: Color.violet100)
}
