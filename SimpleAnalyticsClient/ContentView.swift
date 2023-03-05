//
//  ContentView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PostView(post: sendCreateEvent)
                .tabItem {
                    Label("Create Event", systemImage: "square.and.arrow.up")
                }

            EventListView(events: [])
                .tabItem {
                    Label("Events", systemImage: "list.bullet")
                }
        }
        .padding()
    }
    
    private func sendCreateEvent() {
        print(#function)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
