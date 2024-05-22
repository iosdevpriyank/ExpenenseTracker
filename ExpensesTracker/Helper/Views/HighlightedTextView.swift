//
//  HighlightedTextView.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 20/05/24.
//

import SwiftUI

struct HighlightedTextView: View {
    let text: Text
    
    
    private static let regularExpression = try! NSRegularExpression(
        pattern: "###(?<content>((?!\\$\\$\\$).)*)\\$\\$\\$"
    )
    
    private struct SubstringRange {
        let content: NSRange
        let full: NSRange
    }
    
    init(_ string: String) {
        let ranges = Self.regularExpression
            .matches(
                in: string,
                options: [],
                range: NSRange(location: 0, length: string.count)
            )
            .map { match in
                SubstringRange(
                    content: match.range(withName: "content"),
                    full: match.range(at: 0)
                )
            }
        var nextNotProcessedSymbol = 0
        var text = Text("")
        let nsString = string as NSString
        func appendSubstringStartingNextIfNeeded(until endLocation: Int) {
            if nextNotProcessedSymbol < endLocation {
                text = text + Text(nsString.substring(
                    with: NSRange(
                        location: nextNotProcessedSymbol,
                        length: endLocation - nextNotProcessedSymbol
                    )
                ))
            }
        }
        
        for range in ranges {
            appendSubstringStartingNextIfNeeded(until: range.full.location)
            text = text + Text(nsString.substring(with: range.content))
                .foregroundColor(Color.violet100)
            nextNotProcessedSymbol = range.full.upperBound
        }
        appendSubstringStartingNextIfNeeded(until: string.count)
        self.text = text
    }
    
    var body: some View {
        text
    }
}

#Preview {
    HighlightedTextView("Hello ###World$$$")
}

