//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Akash Soni on 04/12/22.
//

import SwiftUI
// Create a new SwiftUI View file named ThemeView.swift.
// You might define a list cell in the same file as the list view structure. By defining the cell in a separate file, you can more easily reuse it in a future project.
// The model for this view is a single instance of Theme.




struct ThemeView: View {
    // Create a theme constant and pass a value in the preview.
    let theme: Theme

    var body: some View {
        // Create a ZStack that has a rounded rectangle filled with the theme’s main color.
        ZStack {
            // Because a ZStack overlays views back to front, the RoundedRectangle acts as a background and appears behind the views listed below it.
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            // Replace the text view with a label that displays the theme name and the paintpalette system image.
            // Low contrast between the theme’s main color and the default label text color can make this view difficult to read.
            Label(theme.name, systemImage: "paintpalette")
            // Add a padding of 4 to the label.
                .padding(4)

        }
        // Set the foreground color of the ZStack to the theme’s accent color and match its vertical size to the intrinsic size of the label.
        // Complete the theme view’s design by making the label more legible and displaying more of the theme’s color.
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}
// Next, you’ll use this theme view as a cell in a list to display all the themes to the user.


struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        // The app’s UI will display the theme name and colors.
        ThemeView(theme: .bubblegum)
    }
}

