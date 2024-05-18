//
//  CustomIndicatorView.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 17/05/24.
//

import SwiftUI

struct CustomIndicatorView: View {
    
    var totalPages: Int
    var currentPage: Int
    var activeTint: Color = Color.violet100
    var inActiveTint: Color = Color.init(hexString: "#EEE5FF") ?? .gray
    
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalPages, id: \.self) {
                Circle()
                    .fill(currentPage == $0 ? activeTint : inActiveTint)
                    .frame(width: currentPage == $0 ? 16.0 : 8.0, height: currentPage == $0 ? 16.0 : 8.0)
            }
        }
    }
}

#Preview {
    OnBoardingViews()
}
