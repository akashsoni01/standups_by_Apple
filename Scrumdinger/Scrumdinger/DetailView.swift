//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Akash Soni on 03/12/22.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum

    var body: some View {
        Text("Hello, World!")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}

