//
//  FilterByBoolView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/20/23.
//

import SwiftUI

struct FilterByBoolView: View {
    let title: String
    @Binding var value: Bool?
    @State private var lastValue = false
        
    var body: some View {
        let matchFlag = Binding<Bool>(
            get: { value != nil },
            set: { value = ($0 == true) ? lastValue : nil }
        )
        
        let flagValue = Binding<Bool>(
            get: { value ?? lastValue },
            set: { value = $0; lastValue = $0 }
        )

        return Group {
            
            Toggle(isOn: matchFlag) {
                Text("\(title):")
            }

            Picker(selection: flagValue, content: {
                Text("True").tag(true)
                Text("False").tag(false)
            }, label: {
            })
            .disabled(!matchFlag.wrappedValue)
        }
    }
}
