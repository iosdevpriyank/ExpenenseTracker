//
//  AppState.swift
//  ExpensesTracker
//
//  Created by Akshat Gandhi on 26/05/24.
//

import Foundation
import SwiftUI

final class NavigationState: ObservableObject {
    @Published var appRoutes: [Route] = []

    func popToRoot() {
        appRoutes.removeLast(appRoutes.count)
    }
    
    func popTo(_ route: Route) {
        guard let index = appRoutes.firstIndex(of: route) else { return }
        appRoutes = Array(appRoutes[0...index])
    }
}
