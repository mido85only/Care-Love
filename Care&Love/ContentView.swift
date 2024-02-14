//
//  ContentView.swift
//  Care&Love
//
//  Created by mohammed on 11/02/2024.
//

import SwiftUI

struct ContentView: View {
    //Properties
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    //Body
    var body: some View {
        if isOnboarding {
            Onboarding()
        }else {
            Home()
        }
    }
}

#Preview {
    ContentView()
}
