//
//  AppConstants.swift
//  ExpensesTracker
//
//  Created by Akshat Gandhi on 25/05/24.
//

import Foundation

struct AppConstants {
    static var apiKey: String =  {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else {
            fatalError("Api key must not be empty in plist")
        }
        return apiKey
    }()
}
