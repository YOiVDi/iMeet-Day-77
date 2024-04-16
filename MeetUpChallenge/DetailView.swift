//
//  DetailView.swift
//  MeetUpChallenge
//
//  Created by Yordan Dimitrov on 16.04.24.
//

import SwiftUI

struct DetailView: View {
    var person: Person
    var body: some View {
            VStack {
                person.swiftUiImage
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal)
            }
            .ignoresSafeArea()
            .navigationTitle(person.name)
    }
}

#Preview {
    DetailView(person: Person.personExample)
}
