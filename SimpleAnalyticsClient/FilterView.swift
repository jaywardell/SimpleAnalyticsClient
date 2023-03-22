//
//  FilterView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/20/23.
//

import SwiftUI
import SimpleAnalyticsTypes

struct FilterView: View {
    
    @State private var flag: Bool?
    @State private var action: UserEvent.Action?

    var body: some View {
        Grid(alignment: .leading) {
            GridRow {
                FilterByBoolView(title: "Flag", value: $flag)
                    .onChange(of: flag) { newValue in
                        print(String(describing: newValue))
                    }
            }

            GridRow {
                FilterByActionView(value: $action)
                    .onChange(of: action) { newValue in
                        print(String(describing: newValue))
                    }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
            .padding()
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
