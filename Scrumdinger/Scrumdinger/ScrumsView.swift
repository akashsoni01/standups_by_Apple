//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Akash Soni on 03/12/22.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]

    var body: some View {
        // The List initializer in this step accepts a ViewBuilder as its only parameter. So, you can add rows with the same syntax you’ve been using with other container views such as HStack and VStack.
        // You can also initialize lists from collections of data, specify a different selection type, and more. To learn about the List view, read the Apple Developer Documentation.
        // Next, you’ll populate the List using a ForEach view. To create views using ForEach, you’ll pass its initializer a collection of items along with a closure that creates a view for each item.
        List {
            // ForEach needs a way to identify individual items in the collection. For now, because all of the scrums in the test data have different names, you can use the title property to identify each item.
            /*
             // Before Identifiable
             ForEach(scrums, id: \.title) { scrum in
                 // Initialize a CardView in the ForEach closure.
                 // This closure returns a CardView for each element in the scrums array.
                 CardView(scrum: scrum)
                 // Set the background color of the row to scrum.theme.mainColor.
                     .listRowBackground(scrum.theme.mainColor)
             }
             */
            
            // After Identifiable
            ForEach(scrums) { scrum in
                // Initialize a CardView in the ForEach closure.
                // This closure returns a CardView for each element in the scrums array.
                // Add a NavigationLink, passing Text(scrum.title) as the destination in the initializer.
                // The destination presents a single view in the navigation hierarchy when a user interacts with the element. Each row pushes to an individual destination. The Text view acts as a placeholder until you create the detail screen in the next section.
                // before navigation link
                /*
                 CardView(scrum: scrum)
                 // Set the background color of the row to scrum.theme.mainColor.
                     .listRowBackground(scrum.theme.mainColor)
                 // the list row background moved to link
                 */
                // after navigation link
                // Before destination view add
                /*
                 NavigationLink(destination: Text(scrum.title)) {
                     CardView(scrum: scrum)
                 }
                 */
                // After destination view add
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }

                // Set the background color of the row to scrum.theme.mainColor.
                    .listRowBackground(scrum.theme.mainColor)
            }
        }
        // Add a navigationTitle of "Daily Scrums".
        // Notice that you add the .navigationTitle modifier to the List. The child view can affect the appearance of the NavigationView using modifiers.
        .navigationTitle("Daily Scrums")
        // Add a toolbar, and add a Button toolbar item that displays the plus icon. Pass an empty action to the button for now.
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
        }
        // Add an accessibilityLabel that describes the purpose of the plus button.
        .accessibilityLabel("New Scrum")
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        // Adding the NavigationView displays navigation elements, like title and bar buttons, on the canvas. For now, the preview displays padding for a navigation title.
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
        }
    }
}


/*
 Which code snippet displays LoginMessageView in the preview canvas?

 struct LoginMessageView: View {
    @Binding var name: String
    var body: some View {
       Text("Welcome back, \(name)")
    }
 }

 Answer
 
 struct LoginMessageView_Previews: PreviewProvider {
    static var previews: some View {
       LoginMessageView()
    }
 }


 
 Which code snippet lets ChildView modify the message that appears in ParentView?

 Answer
 
 struct ParentView: View {
     @State private var message = "Hello world"
     var body: some View {
         VStack {
             ChildView(text: $message)
             if !message.isEmpty {
                 Text(message)
             }
         }
     }
 }
 You can use bindings to pass data to different views that need to mutate it.
 */
