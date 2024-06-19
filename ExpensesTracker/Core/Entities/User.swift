//
//  User.swift
//  ExpensesTracker
//
//  Created by Akshat Gandhi on 09/06/24.
//

import Foundation

struct User: Codable {
    var email: String
    var password: String
    var firstName: String
    var signupDate = Date.now
}
