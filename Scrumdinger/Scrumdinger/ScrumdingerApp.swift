//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Akash Soni on 03/12/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    // In ScrumdingerApp.swift, add a private @State property named scrums.
    // For now, you initialize the property with sample data.
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        // WindowGroup is one of the primitive scenes that SwiftUI provides. In iOS, the views you add to the WindowGroup scene builder are presented in a window that fills the device’s entire screen.
        WindowGroup {
            // embed ScrumsView in a NavigationView.
            NavigationView {
                // Before binding the app State
                // ScrumsView(scrums: DailyScrum.sampleData)
                // After binding the app State. Don't forget to change sthe ScrumsView state to @State. 
                ScrumsView(scrums: $scrums)

            }
        }
    }
}
