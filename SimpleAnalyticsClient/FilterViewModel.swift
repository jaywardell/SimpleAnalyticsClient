//
//  FilterViewModel.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/22/23.
//

import Foundation
import SimpleAnalyticsTypes

struct FilterViewModel: Equatable {
    var flag: Bool?
    var action: UserEvent.Action?
    
    func filter(_ components: URLComponents) -> URLComponents {
        var out = components
        
        if let flag {
            out = out.addingQueryItem("flag", value: flag)
        }
        if let action {
            out = out.addingQueryItem("action", value: action.rawValue)
        }
        
        return out
    }
}
