//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Akash Soni on 03/12/22.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    // In DetailView.swift, add a @State property named isPresentingEditView.
    @State private var isPresentingEditView = false

    var body: some View {
        // You’ll use the list to display static subviews in a single column with rows. In the next section of this tutorial, you’ll dynamically build list rows.
        
        List {
            // Add a Section with the header Meeting Info.
            // Sections create visual distinctions within your list. They help you to chunk content and establish groups in the information hierarchy of the list view.
            Section(header: Text("Meeting Info")) {
                // Add a Label that contains the text "Start Meeting" and a timer icon.
                // Tapping this row does nothing. But in the future, it will navigate users to the meeting view.
                // By default, VoiceOver reads the title of the Label. If you want VoiceOver to convey more detail, replace the default spoken text by adding an accessibilityLabel that describes the element.
                
                /*
                 // before navigation link added on label tap. It was a simple label.
                 Label("Start Meeting", systemImage: "timer")
                 */
                // After navigation link added on label tap with destination Meeting View - Start
                // Adding NavigationLink wraps the label in a gesture recognizer so that users can tap this row to transition to the meeting timer screen.
                NavigationLink(destination: MeetingView()){                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                // After navigation link added on label tap move to Meeting View - End
                
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
                // add a Spacer(), and display the theme name in a Text view. Add accessibilityElement(children:) to the HStack to combine the Label and Text elements in VoiceOver.
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                    // Style the Text view by adding padding, foreground and background colors, and a corner radius.
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)

                }
                .accessibilityElement(children: .combine)

            }
            // In DetailView.swift, create a Section with a header of "Attendees" to group the attendee information.
            Section(header: Text("Attendees")) {
                // Add a ForEach to dynamically generate the list of attendees, and pass scrum.attendees as the data.
                ForEach(scrum.attendees) { attendee in
                    // Add a Label to display the attendee.name with a person icon.
                    Label(attendee.name, systemImage: "person")
                }
            }

        }
        // Display the scrum title by setting .navigationTitle(scrum.title) on the List.
        .navigationTitle(scrum.title)
        // Add a toolbar button that sets isPresentingEditView to true.
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        // Add a sheet modifier on List.
        // When isPresentingEditView changes to true, the app presents DetailEditView using a modal sheet that partially covers the underlying content.
        // Modal views remove users from the main navigation flow of the app. Use modality for short, self-contained tasks. For more information about the different types of modal presentation and when to use modality effectively in your apps, see Modality in the Human Interface Guidelines.
        .sheet(isPresented: $isPresentingEditView) {
            // Before embed in nav
            /*
             NavigationView {
                 DetailEditView()
             }
             */
            // After embed in nav
            // Embed DetailEditView in a NavigationView.
            // Example of presenting a view with navigation view as nav doesn't embed by default on presenting
            NavigationView {
                DetailEditView()
                // Set the navigation title of the edit view.
                    .navigationTitle(scrum.title)
                // Add a toolbar
                    .toolbar {
                        // Add a toolbar button that indicates to the user that they’re canceling changes to the scrum details. Dismiss DetailEditView in the Cancel button action.
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        // Add a toolbar button that indicates to the user that they’re saving changes. Dismiss DetailEditView in the Done button action.
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                            }
                        }

                    }
            }
        }
    }
}
// SwiftUI automatically includes the animations when pushing and popping from the navigation stack.



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}

