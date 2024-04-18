//
//  ContentView-ViewModel.swift
//  MeetUpChallenge
//
//  Created by Yordan Dimitrov on 16.04.24.
//

import Foundation

extension ContentView {
    @Observable
    class ViewModel {
        var personsList: [Person] = [] {
            didSet {
                save()
            }
        }
        
        var sortedPersonsList: [Person] {
            personsList.sorted()
        }
        
        let path = FileManager().getDocumentDirectory
        let key = "personsList"
        
        let locationFetcher = LocationFetcher()
        
        init() {
            do {
                let data = try Data(contentsOf: path.appending(path: key))
                personsList = try JSONDecoder().decode([Person].self, from: data)
            } catch {
                personsList = []
            }
        }
        
        private func save() {
            let url = path.appending(path: key)
            
            do {
                let data = try? JSONEncoder().encode(personsList)
                try data?.write(to: url, options: [.atomic,.completeFileProtection])
            } catch {
                print("Data cannot be saved !!! \(error.localizedDescription)")
            }
        }
        
        func delete(index: IndexSet) {
            personsList.remove(atOffsets: index)
        }
        
    }
}
