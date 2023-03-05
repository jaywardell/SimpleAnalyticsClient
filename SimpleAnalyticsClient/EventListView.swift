//
//  ListView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/5/23.
//

import SwiftUI

struct EventListView: View {
    
    struct Event: Hashable {
        let date: Date
        let action: String
        let flag: Bool
        let userID: String
    }
    
    let events: [Event]
    
    var body: some View {
        List(events, id: \.self) { event in
            HStack {
                Image(systemName: event.flag ? "checkmark.circle" : "circle")
                Text(event.date, style: .date)
                Text(event.date, style: .time)
                Text(event.action)
            }
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
