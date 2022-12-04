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
    
    // Add a @State property named newAttendeeName.
    // The newAttendeeName property will hold the attendee name that the user enters.
    @State private var newAttendeeName = ""


    var body: some View {
        // Replace the Text view with a Form and add a Section with a “Meeting Info” header.
        // The Form container automatically adapts the appearance of controls when it renders on different platforms.
        Form {
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
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    // Add a Spacer and Text to display the meeting length.
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                    // Hide the text view from VoiceOver.
                    // All the information that VoiceOver needs is in the accessibility value for the slider.
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $data.theme)
            }
            
            // Add a second Section with an “Attendees” header.
            Section(header: Text("Attendees")) {
                // Add a ForEach view, and display each attendee in a Text view.
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                // Add an onDelete modifier to remove attendees from the scrum data.
                // The framework calls the closure you pass to onDelete when the user swipes to delete a row.
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                // Add an HStack containing a TextField, and pass a binding to the newAttendeeName property.
                HStack {
                    // The binding keeps newAttendeeName in sync with the contents of the text field. It doesn’t affect the original DailyScrum model data.
                    TextField("New Attendee", text: $newAttendeeName)
                    // Add a Button with an empty action and an Image label.
                    // Before animation block
                    /*
                     Button(action: {}) {
                         Image(systemName: "plus.circle.fill")
                     }
                     */
                    // After animation block
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(attendee)
                            // Set newAttendeeName to an empty string inside the animation block.
                            // Because the text field has a binding to newAttendeeName, setting the value to the empty string also clears the contents of the text field.
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                        // Add an accessibility label to the image.
                            .accessibilityLabel("Add attendee")
                    }
                    // Disable the button if newAttendeeName is empty.
                    .disabled(newAttendeeName.isEmpty)
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



/*
 Which modifier can you add to the button to present EditView?
 
 struct ContentView: View {
     @State private var isPresented = false
     var body: some View {
         Button(action: { isPresented = true }) {
             Text("Edit")
         }
     }
 }
 
 Answer
 
 Button(action: { isPresented = true }) {
     Text("Edit")
 }
 .sheet(isPresented: $isPresented) {
     EditView()
 }
 
The sheet modifier takes a binding to a Bool and a view builder.
 */

