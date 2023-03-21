//
//  FilterByActionView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/20/23.
//

import SwiftUI
import SimpleAnalyticsTypes

struct FilterByActionView: View {
    @Binding var value: UserEvent.Action?
    @State private var lastValue: UserEvent.Action = .start
        
    var body: some View {
        let matchAction = Binding<Bool>(
            get: { value != nil },
            set: { value = ($0 == true) ? lastValue : nil }
        )
        
        let flagValue = Binding<String>(
            get: { value?.rawValue ?? lastValue.rawValue },
            set: { value = UserEvent.Action(rawValue: $0); lastValue = UserEvent.Action(rawValue: $0)! }
        )

        return Group {
            
            Toggle(isOn: matchAction) {
                Text("Action:")
            }

            Picker("Action", selection: flagValue, content: {
                ForEach(UserEvent.Action.allCases, id: \.rawValue) { action in
                    Text(action.rawValue)
                }
            })
            .labelsHidden()
            .disabled(!matchAction.wrappedValue)

        }
    }
}

