//
//  FirebaseCollection.swift
//  ExpensesTracker
//
//  Created by Akshat Gandhi on 09/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FirebaseCollection {
    
    //MARK: Private Properties
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    var uuid: String? {
        auth.currentUser?.uid
    }
    
    var userIsAuthenticated: Bool {
        auth.currentUser != nil
    }
    
    //MARK: Firebase Auth Functions
    
    func signUp(email: String, password: String, firstName: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            guard authResult != nil, error == nil else { return }
            
        }
    }
    
}
