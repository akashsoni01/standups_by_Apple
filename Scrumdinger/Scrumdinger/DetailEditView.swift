//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Akash Soni on 04/12/22.
//

import SwiftUI
/*
 Add an edit view for scrum details
 In this section, you’ll create the edit view and add controls for modifying the title and length of the scrum.

 You’ll store changes to the scrum in a Data property. You’ll define the property using the @State wrapper because you need to mutate the property from within the view.

 SwiftUI observes @State properties and automatically redraws the view’s body when the property changes. This behavior ensures the UI stays up to date as the user manipulates the onscreen controls.
 */

struct DetailEditView: View {
    // Recall that the @State property wrapper defines the source of truth for value types.
    // Declare @State properties as private so they can be accessed only within the view in which you define them.
    @State private var data = DailyScrum.Data()

    var body: some View {
        // Replace the Text view with a Form and add a Section with a “Meeting Info” header.
        // The Form container automatically adapts the appearance of controls when it renders on different platforms.
        Form {
            Section(header: Text("Meeting Info")) {
                Section(header: Text("Meeting Info")) {
                    // Inside Section, add a TextField for the meeting title.
                    // TextField takes a binding to a String. You can use the $ syntax to create a binding to data.title. The current view manages the state of the data property.
                    TextField("Title", text: $data.title)
                    // Add an HStack and a Slider for the meeting length. In the slider’s label closure, add a Text view for accessibility use.
                    // A Slider stores a Double from a continuous range that you specify. Passing a step value of 1 limits the user to choosing whole numbers.
                    HStack {
                        Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                            // The Text view won’t appear on screen, but VoiceOver uses it to identify the purpose of the slider.
                            Text("Length")
                        }
                    }
                    // Add a Spacer and Text to display the meeting length.
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                }
            }
        }
        
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}

