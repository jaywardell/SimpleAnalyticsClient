//
//  PostView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/5/23.
//

import SwiftUI
import SimpleAnalyticsTypes

struct PostView: View {
        
    let userID = UUID()
    
    var body: some View {
        Button(action: post) {
            Text("Post a Random Event")
        }
    }

    private func post() {
        Task {
            do {
                let event = UserEvent(action: .allCases.randomElement()!, userID: userID, flag: .random())
                                
                let payload = try JSONEncoder().encode(event)
                
                let components = URLComponents.testServer()
                    .addingPathComponent("userevent")
                
                let request = URLRequest(components, method: .post, body: payload, headers: [
                    ("content-type", "application/json"),
                    ("verbose", "true")
                ] )!
                
                try await URLSession.shared.send(request)
            }
            catch {
                print(error)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
