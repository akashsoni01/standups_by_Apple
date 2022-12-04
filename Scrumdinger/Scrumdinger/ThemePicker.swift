//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Akash Soni on 04/12/22.
//

import SwiftUI
// Create a new SwiftUI View file named ThemePicker.swift.
struct ThemePicker: View {
    // Try to maintain a single source of truth for every piece of data in your app. Instead of creating a new source of truth for the theme picker, you’ll use a binding that references a theme structure defined in the parent view.
    // Create a binding to a theme named selection.
    // This binding communicates changes to the theme within the theme picker, back to the parent view.
    @Binding var selection: Theme
    // Note - Defining selection creates compiler errors because the theme picker requires a binding. You’ll see similar errors throughout this tutorial as you update other views.

    var body: some View {
        // Add a picker with the title “Theme” and pass the selection binding.
        // The picker will display all available themes. You’ll make Theme conform to CaseIterable so that you can easily access all the enumeration’s cases.
        Picker("Theme", selection: $selection) {
            // In ThemePicker.swift, add a ForEach to list all cases of Theme. after making cases CaseIterable and Identifiable
            ForEach(Theme.allCases) { theme in
                // Add a ThemeView and tag it with the theme.
                // You can tag subviews when you need to differentiate among them in controls like pickers and lists. Tag values can be any hashable type like in an enumeration.
                ThemeView(theme: theme)
                    .tag(theme)
            }

        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        // Pass a constant binding to initialize a theme picker in the preview.
        // You can use the constant(_:) type method to create a binding to a hard-coded, immutable value. Constant bindings are useful in previews or when prototyping your app’s UI.
        ThemePicker(selection: .constant(.periwinkle))
    }
}

