//
//  FilterView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/20/23.
//

import SwiftUI

struct FilterView: View {
    
    @State private var flag: Bool?
    

    
    var body: some View {
        let matchFlag = Binding<Bool>(
            get: { flag != nil },
            set: { flag = ($0 == true) ? false : nil }
        )
        
        let flagValue = Binding<Bool>(
            get: { flag ?? false },
            set: { flag = $0 }
        )

        return VStack(alignment: .leading) {
            
            Toggle(isOn: matchFlag) {
                Text("Filter by Flag")
            }
            Toggle(isOn: flagValue) {
                Text("Flag")
            }
            .padding(.leading)
            .disabled(!matchFlag.wrappedValue)
        }
        .onChange(of: flag) { newValue in
            print(newValue)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
