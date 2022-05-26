//
//  ContentView.swift
//  Proptiger
//
//  Created by Kshitij Gulati on 18/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Onboarding()
                ModalAnchorView()
            }
            .environmentObject(ModalManager())
            .navigationBarHidden(true)
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
