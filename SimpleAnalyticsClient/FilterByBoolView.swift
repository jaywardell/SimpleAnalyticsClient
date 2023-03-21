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
        
    var body: some View {
        let matchFlag = Binding<Bool>(
            get: { value != nil },
            set: { value = ($0 == true) ? false : nil }
        )
        
        let flagValue = Binding<Bool>(
            get: { value ?? false },
            set: { value = $0 }
        )

        return HStack {
            
            Toggle(isOn: matchFlag) {
//                Picker(selection: flagValue, content: {
//                    Text("True").tag(true)
//                    Text("False").tag(false)
//                }, label: {
//                    Text(title)
//                })
//                .pickerStyle(.radioGroup)
                Toggle(isOn: flagValue) {
                    Text("Flag")
                }
                .disabled(!matchFlag.wrappedValue)
            }
        }
    }
}
