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
        
    var body: some View {
        let matchAction = Binding<Bool>(
            get: { value != nil },
            set: { value = ($0 == true) ? .start : nil }
        )
        
        let flagValue = Binding<String>(
            get: { value?.rawValue ?? UserEvent.Action.start.rawValue },
            set: { value = UserEvent.Action(rawValue: $0) }
        )

        return Group {
            
            Toggle(isOn: matchAction) {
            }

            Picker("Action", selection: flagValue, content: {
                ForEach(UserEvent.Action.allCases, id: \.rawValue) { action in
                    Text(action.rawValue)
                }
            })
            .disabled(!matchAction.wrappedValue)

        }
    }
}

