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
    
    private var matchAction: Binding<Bool> {
        Binding<Bool>(
            get: { value != nil },
            set: { value = ($0 == true) ? lastValue : nil }
        )
    }

    private var flagValue: Binding<String> {
        Binding<String>(
            get: { value?.rawValue ?? lastValue.rawValue },
            set: { value = UserEvent.Action(rawValue: $0); lastValue = UserEvent.Action(rawValue: $0)! }
        )
    }

    
    var body: some View {
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

