//
//  ContentView.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 27/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tab: Tab = .home
        
    private enum Tab {
        case home, settings
    }
    
    @ViewBuilder var view: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            NavigationView {
                // Sidebar
                // BitcoinView
            }
        } else {
            TabView(selection: $tab) {
                BitcoinView()
                    .tabItem {
                        Label("Convert", systemImage: "arrow.counterclockwise.circle")
                    }
                    .tag(Tab.home)

                Text("Settings")
                    .tabItem {
                        Label("About", systemImage: "info.circle")
                    }
                    .tag(Tab.settings)
            }
        }
    }
    
    var body: some View {
        view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
