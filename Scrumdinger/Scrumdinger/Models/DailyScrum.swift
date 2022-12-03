//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Akash Soni on 03/12/22.
//

import Foundation

// ForEach structures generate dynamic views by iterating over identifiable data. In the previous section, you used a key path to identify scrums by their titles. This approach worked for prototyping because each scrum in the sample data has a unique title. But users would experience issues if they tried to create a new scrum with the same title as an existing one.
// To work with user-generated content, you’ll make DailyScrum conform to the Identifiable protocol for a more robust way to communicate identity. The protocol has one requirement: an id property that provides a stable identifier for the entity.

/*
 // Before Identifiable
 struct DailyScrum {
     var title: String
     var attendees: [String]
     var lengthInMinutes: Int
     var theme: Theme
 }

 // After Identifiable
 */
struct DailyScrum: Identifiable {
    // Add a constant named id of type UUID.
    let id: UUID
    
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    //Remember - Add an initializer that assigns a default value to the id property.
    // When you define a default value for a parameter, you can omit that parameter when you call an initializer or function.
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
            self.id = id
            self.title = title
            self.attendees = attendees.map { Attendee(name: $0) }
            self.lengthInMinutes = lengthInMinutes
            self.theme = theme
        }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}


// In DailyScrum.swift, create an extension with an inner structure named Attendee that is identifiable.
extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        // Add an initializer that assigns a default value to the id property.
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}

