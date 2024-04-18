//
//  ContentView.swift
//  MeetUpChallenge
//
//  Created by Yordan Dimitrov on 14.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var addViewSheet = false
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sortedPersonsList, id: \.self) { person in
                    HStack {
                        person.swiftUiImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(.circle)
                        NavigationLink(person.name, value: person)
                    }
                }
                .onDelete(perform: viewModel.delete)
            }
            .navigationTitle("iMeet")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addViewSheet = true
                    } label: {
                        Label("Add", systemImage: "plus.circle")
                    }
                }
            }        
            .navigationDestination(for: Person.self) { person in
                DetailView(person: person, locationFetcher: viewModel.locationFetcher)
            }
        }
        .sheet(isPresented: $addViewSheet) {
            AddView(locationFetcher: viewModel.locationFetcher) { person in
                viewModel.personsList.append(person)
            }
        }
    }
}

#Preview {
    ContentView()
}
