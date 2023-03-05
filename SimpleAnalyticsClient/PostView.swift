//
//  PostView.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/5/23.
//

import SwiftUI

struct PostView: View {
    
    let post: ()->()
    
    var body: some View {
        Button(action: post) {
            Text("Post a Random Event")
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView() {}
    }
}
