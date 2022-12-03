//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Akash Soni on 03/12/22.
//

import SwiftUI

// Create a new structure named TrailingIconLabelStyle that conforms to LabelStyle.
// Optional - If you don’t want to create a custom label style, you can use one of the built-in label styles that display the icon, the title, or both using a system-standard layout.

struct TrailingIconLabelStyle: LabelStyle {
    // Inside the HStack, add configuration.title and configuration.icon.
    // The configuration parameter is a LabelStyleConfiguration, which contains the icon and title views. These views represent the label’s image and label text.
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}


// Add an extension on LabelStyle that creates a static property named trailingIcon.
// Because you defined the label style as a static property, you can call it using leading-dot syntax, which makes your code more readable.
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}

