//
//  CardView.swift
//  Scrumdinger
//
//  Created by Akash Soni on 03/12/22.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum

    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            // This modifier helps convey the information architecture of the view by reading the scrum title, followed by “heading.”
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                // Use an accessibility modifier to add a label that describes the contents of the first Label in the HStack.
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                // How should you set the accessibility label on Image in the code snippet below?
                // The clock icon now aligns on the trailing edge, mirroring the leading label for the number of attendees.
                    .labelStyle(.trailingIcon)
                // Add a similar accessibility modifier to the second Label in the HStack.
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")

            }
            
            // Style all the fonts inside the HStack as captions.
            .font(.caption)
        }
        // Add padding to the VStack, and set the foregroundColor using scrum.theme.accentColor.
        .padding()
        .foregroundColor(scrum.theme.accentColor)

    }
}

//struct CardView_Previews: PreviewProvider {
//    static var scrum = DailyScrum.sampleData[0]
//
//    static var previews: some View {
//        CardView(scrum: scrum)
//        // Specify a background color for the preview using scrum.theme.mainColor, and set the preview size using the previewLayout modifier.
//            .background(scrum.theme.mainColor)
//            .previewLayout(.fixed(width: 400, height: 60))
//
//    }
//}
//
