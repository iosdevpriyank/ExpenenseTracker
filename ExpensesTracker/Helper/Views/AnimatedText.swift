//
//  AnimatedText.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 17/05/24.
//

import SwiftUI

struct AnimatedText: View {
    @State private var moveGradiant = true
    
    @State var strText: String
    @State var higlightedColor: Color
    @State var newFont: Font?
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.size.width
        Rectangle()
            .overlay {
                LinearGradient(colors: [.clear,higlightedColor,.clear], startPoint: .leading, endPoint: .trailing)
                    .offset(x:moveGradiant ? -screenWidth/2  : screenWidth/2)
            }
            .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: moveGradiant)
            .mask({
                Text(strText)
                    .font(newFont)
            })
            .onAppear {
                self.moveGradiant.toggle()
            }
    }
}

#Preview {
    AnimatedText(strText: "Animated Text", higlightedColor: .yellow, newFont: Font.Title_X)
}
