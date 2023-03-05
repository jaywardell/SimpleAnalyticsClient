//
//  PostView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/5/23.
//

import SwiftUI

struct PostView: View {
        
    var body: some View {
        Button(action: post) {
            Text("Post a Random Event")
        }
    }
    
    private func post() {
        print(#function)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
