//
//  DetailView.swift
//  MeetUpChallenge
//
//  Created by Yordan Dimitrov on 16.04.24.
//

import SwiftUI
import MapKit

struct DetailView: View {
    var person: Person
    let locationFetcher: LocationFetcher
    @State private var mapStartPositon = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.1657, longitude: 10.4515), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    @State private var bouncingAnimation = false
    @State private var mapShow = false
    
    var body: some View {
        VStack {
            if mapShow == false {
                person.swiftUiImage
                //                    Image(.example) // -- Test Image
                    .resizable()
                    .scaledToFill()
            } else {
                Map(position: $mapStartPositon) {
                    Annotation(person.name, coordinate: person.location.location) {
                        person.swiftUiImage
                            .resizable()
                            .scaledToFit()
                            .clipShape(.circle)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(.red)
                                    .frame(width: 30, height: 30)
                                    .scaleEffect(bouncingAnimation ? 2 : 1)
                                    .opacity(bouncingAnimation ? 0.1 : 1)
                                    .animation(.easeInOut.repeatForever(autoreverses: true), value: bouncingAnimation)
                                    .onAppear {
                                        self.bouncingAnimation.toggle()
                                    }
                            )
                    }
                }
                
            }
        }
        .animation(.easeInOut, value: mapShow)
        .ignoresSafeArea()
        .onAppear {
            self.mapStartPositon = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: person.location.latitude, longitude: person.location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)))
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    self.mapShow.toggle()
                } label: {
                    Label("Map", systemImage: "map.circle")
                }
            }
        }
        .navigationTitle(person.name)
    }
}

#Preview {
    NavigationStack {
        DetailView(person: Person.personExample, locationFetcher: LocationFetcher())
    }
}
