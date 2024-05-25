//
//  ExpensesTrackerApp.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 15/05/24.
//

import SwiftUI

@main
struct ExpensesTrackerApp: App {
    @State private var isLaunchScreen: Bool = true
    var body: some Scene {
        WindowGroup {
            ZStack {
                Group {
                    if isLaunchScreen {
                        LaunchScreenView()
                    } else {
                        OnBoardingViews()
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isLaunchScreen = false
                    }
                }
                
            }
            
        }
    }
}
