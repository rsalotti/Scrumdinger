//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Ricardo Santos on 18/12/24.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Reunião Info")) {
                TextField("Título", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lenghtInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Duração")
                    }
                    .tint(scrum.theme.mainColor)
                    .accessibilityValue("\(scrum.lengthInMinutes) minutos")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutos")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Participantes")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("Inserir novo participante...", text: $newAttendeeName)
                    Button {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .tint(scrum.theme.accentColor)
                            .accessibilityLabel("Inserir participante")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}


struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
