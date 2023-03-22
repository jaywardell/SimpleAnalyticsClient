//
//  FilterView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/20/23.
//

import SwiftUI
import SimpleAnalyticsTypes


struct FilterView: View {
  
    @Binding var viewModel: FilterViewModel
    
    var body: some View {
        Grid(alignment: .leading) {
            GridRow {
                FilterByBoolView(title: "Flag", value: $viewModel.flag)
                    .onChange(of: viewModel.flag) { newValue in
                        print(String(describing: newValue))
                    }
            }

            GridRow {
                FilterByActionView(value: $viewModel.action)
                    .onChange(of: viewModel.flag) { newValue in
                        print(String(describing: newValue))
                    }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: .constant(FilterViewModel()))
            .padding()
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
