//
//  FavoriteLandmarkTip.swift
//  DiscoveringTipKit
//
//  Created by Vincent on 10/08/2023.
//

import SwiftUI
import TipKit

// Define your tip's content.
struct FavoriteLandmarkTip: Tip {
    static let didClickButton: Tip.Event = Tip.Event(id: "didClickButton")

    @Parameter
    static var userIsLoggedIn: Bool = false
    
    var title: Text {
        Text("Save as a Favorite")
    }


    var message: Text? {
        Text("Your favorite landmarks always appear at the top of the list.")
    }


    var asset: Image? {
        Image(systemName: "star")
    }
    
    var rules: [Rule] {
        #Rule(Self.didClickButton) {
            $0.donations.count > 3
        }
        #Rule(Self.$userIsLoggedIn) {
            $0 == true
        }
    }
    
    var actions: [Action] {
        Action(id: "my-action", title: "Do something") {
            print("Action performed")
        }
    }
}


