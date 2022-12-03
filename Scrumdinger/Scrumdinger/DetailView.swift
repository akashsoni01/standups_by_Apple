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
        // You’ll use the list to display static subviews in a single column with rows. In the next section of this tutorial, you’ll dynamically build list rows.
        
        List {
            // Add a Section with the header Meeting Info.
            // Sections create visual distinctions within your list. They help you to chunk content and establish groups in the information hierarchy of the list view.
            Section(header: Text("Meeting Info")) {
                // Add a Label that contains the text "Start Meeting" and a timer icon.
                // Tapping this row does nothing. But in the future, it will navigate users to the meeting view.
                // By default, VoiceOver reads the title of the Label. If you want VoiceOver to convey more detail, replace the default spoken text by adding an accessibilityLabel that describes the element.
                
                Label("Start Meeting", systemImage: "timer")
                // Alter the appearance of the label by adding foregroundColor and font modifiers.
                // This row is an interactive element. To use the same color as other interactive elements, use accentColor.
                    .font(.headline)
                    .foregroundColor(.accentColor)
                // Create an HStack, and add a Label with the clock icon for the meeting length. - start
                HStack {
                    Label("Length", systemImage: "clock")
                    // Add a Spacer, and display the value of the meeting length in a Text view.
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")

                }
                // Add accessibilityElement(children:) to the HStack to combine the Label and Text elements for accessibility users.
                // VoiceOver then reads the two elements as one statement, for example, “Length, 10 minutes.” Without the modifier, VoiceOver users have to swipe again between each element.
                .accessibilityElement(children: .combine)

                // - end

            }

        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}

