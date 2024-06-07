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
    
    @StateObject private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.appRoutes) {
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
                .navigationDestination(for: Route.self) { appRoute in
                    switch appRoute {
                    case .Login:
                        LoginView()
                    case .Signup:
                        SignupView()
                    case .onBoarding:
                        OnBoardingViews()
                    }
                }
            }.environmentObject(navigationState)
        }
    }
}
