//
//  PostView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/5/23.
//

import SwiftUI
import SimpleAnalyticsTypes

struct PostView: View {
        
    var body: some View {
        Button(action: post) {
            Text("Post a Random Event")
        }
    }

    private func post() {
        Task {
            do {
                let event = UserEvent(action: .allCases.randomElement()!, userID: UUID(), flag: .random())
                                
                let payload = try JSONEncoder().encode(event)
                
                let components = URLComponents.testServer()
                    .addingPathComponent("userevent")
                let request = URLRequest(components, method: .post, body: payload, headers: [
                    ("content-type", "application/json"),
                    ("verbose", "true")
                ] )!

                let (data, response) = try await URLSession.shared.data(for: request)
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                print("status code: \(String(describing: statusCode))")
                print("response: \"\(String(data: data, encoding: .utf8) ?? "no data")\"")
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
