//
//  SwiftUIView.swift
//  DiscoveringTipKit
//
//  Created by Vincent on 10/08/2023.
//

import SwiftUI

struct SwiftUIView: View {
    
    // Create an instance of your tip.
    var favoriteLandmarkTip = FavoriteLandmarkTip()
    
    @State
    var userIsLoggedIn = false
    
    var body: some View {
        HStack {
            Image(systemName: "star")
                .imageScale(.large)
                .popoverTip(favoriteLandmarkTip, arrowEdge: .top)

            Button("Click me!") {
                FavoriteLandmarkTip.didClickButton.donate()
            }
            
            Button(userIsLoggedIn ? "Log In" : "Log Out") {
                userIsLoggedIn.toggle()
            }
        }
        .onChange(of: userIsLoggedIn, { _, newValue in
            FavoriteLandmarkTip.userIsLoggedIn = newValue
        })
    }
}

#Preview {
    SwiftUIView()
}
