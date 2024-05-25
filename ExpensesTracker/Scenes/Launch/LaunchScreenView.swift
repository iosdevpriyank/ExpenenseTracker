//
//  LaunchScreenView.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 15/05/24.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack{
            Color.violet100
                .ignoresSafeArea()
            AnimatedText(strText: "montra", higlightedColor: Color.yellow100, newFont: Font.Title_X)
                .foregroundStyle(Color.white)
        }
        
        
    }
}

#Preview {
    LaunchScreenView()
}
