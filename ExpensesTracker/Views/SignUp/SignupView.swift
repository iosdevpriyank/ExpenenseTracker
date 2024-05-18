//
//  SignupView.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 18/05/24.
//

import SwiftUI

struct SignupView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var strUserName: String = ""
    @State private var strEmail: String = ""
    
    var body: some View {
        VStack {
            TextField("Name", text: $strUserName)
                .textFieldStyle(DefaultAppTextFieldStyle())
            TextField("Email", text: $strEmail)
                .textFieldStyle(DefaultAppTextFieldStyle())
            SecureFie
        }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("SignUp")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Back", image: "icon_arrow_back-left")
                    }
                }
            }
    }
}

#Preview {
    SignupView()
}
