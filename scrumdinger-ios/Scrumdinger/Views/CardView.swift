//
//  CardView.swift
//  Scrumdinger
//
//  Created by Ricardo Santos on 13/12/24.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
                .foregroundColor(scrum.theme.accentColor)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .foregroundColor(scrum.theme.accentColor)
                    .accessibilityLabel("\(scrum.attendees.count) participantes")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minutos duração")
                    .labelStyle(.trailingIcon)
                    .foregroundColor(scrum.theme.accentColor)
                    
                    
            }
            .font(.caption)
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.accentColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
