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
                        print(newValue)
                    }
            }

            GridRow {
                FilterByActionView(value: $action)
                    .onChange(of: action) { newValue in
                        print(newValue?.rawValue)
                    }
            }
        }
    }
    
//    var body: some View {
//        let matchFlag = Binding<Bool>(
//            get: { flag != nil },
//            set: { flag = ($0 == true) ? false : nil }
//        )
//
//        let flagValue = Binding<Bool>(
//            get: { flag ?? false },
//            set: { flag = $0 }
//        )
//
//        return HStack {
//
//            Toggle(isOn: matchFlag) {
//                Text("")
//            }
//            Toggle(isOn: flagValue) {
//                Text("Flag")
//            }
////            .padding(.leading)
//            .disabled(!matchFlag.wrappedValue)
//        }
//        .onChange(of: flag) { newValue in
//            print(newValue)
//        }
//    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
