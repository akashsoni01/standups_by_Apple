//
//  Theme.swift
//  Scrumdinger
//
//  Created by Akash Soni on 03/12/22.
//

import SwiftUI

// Add cases for each color listed in the Themes folder in the asset catalog.
// Named colors in the asset catalog must match their references in code, so make sure to spell each case correctly.

// Before CaseIterable and Identifiable
// enum Theme: String { }

// After CaseIterable and Identifiable
// In Theme.swift, add conformance to CaseIterable and Identifiable, using the theme name as its id.
enum Theme: String, CaseIterable, Identifiable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    //The accent color provides a high-contrast complement to the theme’s main color, ensuring your views remain accessible.
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    // Add a Color property named mainColor that creates a color using the enumeration’s rawValue.
    // This property initializes a color from the asset catalog.
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    // After CaseIterable and Identifiable
    var id: String {
        name
    }
}
// you can now add code wit foreach
/*
 ForEach(Theme.allCases) { theme in

            }
 */
