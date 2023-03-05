//
//  ListView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/5/23.
//

import SwiftUI
import SimpleAnalyticsTypes

struct EventListView: View {
    
    struct Event: Hashable {
        let date: Date
        let action: String
        let flag: Bool
        let userID: String
    }
    
    @State private var events: [Event]
    
    init(events: [Event]) {
        self.events = events
    }
    
    var body: some View {
        List(events, id: \.self) { event in
            HStack {
                Image(systemName: event.flag ? "checkmark.circle" : "circle")
                Text(event.date, style: .date)
                Text(event.date, style: .time)
                Text(event.action)
            }
        }
        .task(retrieveEvents)
    }
    
    @Sendable private func retrieveEvents() async {
        do {
            let components = URLComponents.testServer()
                .addingPathComponent("userevents")
            let request = URLRequest(components)!

            let (data, response) = try await URLSession.shared.data(for: request)
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            print("status code: \(String(describing: statusCode))")
            print("response: \"\(String(data: data, encoding: .utf8) ?? "no data")\"")
            
            let userevents = try JSONDecoder().decode([UserEvent].self, from: data)
            
            events = userevents.map {
                Event(date: Date(timeIntervalSinceReferenceDate: $0.timestamp),
                      action: $0.action.rawValue.capitalized,
                      flag: $0.flag,
                      userID: $0.userID.uuidString)
            }
        }
        catch {
            print(error)
        }
    }
}

#if DEBUG

extension EventListView.Event {
    init(_ timeInterval: TimeInterval = 0, action: String, flag: Bool) {
        self.date = Date().addingTimeInterval(timeInterval)
        self.action = action
        self.flag = flag
        self.userID = UUID().uuidString
    }
}

extension Array where Element == EventListView.Event {
    static func random() -> [EventListView.Event] {
        
        let actions = ["eat", "drink", "be hairy"]
        
        return (0..<100).map { i in
            EventListView.Event(TimeInterval(i * 60), action: actions.randomElement()!, flag: Bool.random())
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView(events: .random())
    }
}

#endif
