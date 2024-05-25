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
    @State private var strPassword: String = ""
    @State private var isTermsCondition: Bool = false
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            Form {
                Section {
                    TextField("Name", text: $strUserName)
                        .textFieldStyle(DefaultAppTextFieldStyle())
                    TextField("Email", text: $strEmail)
                        .textFieldStyle(DefaultAppTextFieldStyle())
                    PasswordField(placeholder: "Password", text: $strPassword)
                    CheckBoxViews(isChecked: $isTermsCondition, label: "By signing up, you agree to the [Terms of Service and Privacy Policy](https://www.google.com)", color: Color.violet100)
                }
                
                Section {
                    Button {
                        
                    } label: {
                        Text("Sign Up")
                            .frame(width: 312.0, height: 56.0, alignment: .center)
                            .font(Font.Title_3)
                    }
                    .buttonStyle(VioletButton())
                    .disabled(isTermsCondition == false)
                    
                    Text("or with")
                        .font(Font.Regular_3)
                        .foregroundColor(Color.violet60)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image("icon_google", bundle: nil)
                            Text("Sign up with Google")
                                .font(Font.Title_3)
                                .foregroundColor(Color.violet60)
                        }
                        .frame(width: 312.0, height: 56.0, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke()
                                .foregroundColor(Color.appColor20)
                        )
                        
                    }
                    
                    HStack(spacing: 5.0) {
                        Text("Already have an account?")
                            .font(Font.Regular_3)
                        Button {
                            
                        } label: {
                            Text("Login")
                                .foregroundColor(Color.violet100)
                                .underline()
                        }
                    }
                    .frame(width: 312.0, height: 20.0, alignment: .center)
                    
                }
                
            }.scrollContentBackground(.hidden)
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
}

#Preview {
    SignupView()
}
