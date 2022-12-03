//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Akash Soni on 03/12/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        // WindowGroup is one of the primitive scenes that SwiftUI provides. In iOS, the views you add to the WindowGroup scene builder are presented in a window that fills the device’s entire screen.
        WindowGroup {
            // embed ScrumsView in a NavigationView.
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
