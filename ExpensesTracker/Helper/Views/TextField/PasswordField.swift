//
//  PasswordField.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 19/05/24.
//

import SwiftUI

struct PasswordField: View {
    
    let placeholder: String
    
    @Binding var text: String
    
    @State private var showText: Bool = false
    
    private enum Focus {
        case secure, text
    }
    
    @FocusState
    private var focus: Focus?
    
    @Environment(\.scenePhase)
       private var scenePhase
    
    var body: some View {
        HStack {
            ZStack {
                SecureField(placeholder, text: $text)
                    .focused($focus, equals: .secure)
                    .opacity(showText ? 0 : 1)
                    .listRowSeparator(.hidden)
                TextField(placeholder, text: $text)
                    .focused($focus, equals: .text)
                    .opacity(showText ? 1 : 0)
                    .listRowSeparator(.hidden)
            }
            
            Button(action: {
                showText.toggle()
            }) {
                Image(systemName: showText ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(Color.appColor20)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 14.0)
                .stroke(Color.appColor40, lineWidth: 2.0)
        )
        .onChange(of: focus, { oldValue, newValue in
            // if the PasswordField is focused externally, then make sure the correct field is actually focused
            if newValue != nil {
                focus = showText ? .text : .secure
            }
        })
        .onChange(of: scenePhase, { oldValue, newValue in
            if newValue != .active {
                showText = false
            }
        })
        .onChange(of: showText, { oldValue, newValue in
            if focus != nil { // Prevents stealing focus to this field if another field is focused, or nothing is focused
                DispatchQueue.main.async { // Needed for general iOS 16 bug with focus
                    focus = newValue ? .text : .secure
                }
            }
        })
    }
}

#Preview {
    PasswordField(placeholder: "Enter Password", text: .constant("Value1"))
}
