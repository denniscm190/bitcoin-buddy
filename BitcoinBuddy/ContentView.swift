//
//  ContentView.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 27/11/21.
//

import SwiftUI

struct ContentView: View {
    private enum Tab {
        case bitcoin, wallet, about
    }
    
    @State private var tab: Tab = .bitcoin
    
    @ViewBuilder var view: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            NavigationView {
                Sidebar()
                BitcoinView()
            }
        } else {
            TabView(selection: $tab) {
                BitcoinView()
                    .tabItem {
                        Label("Bitcoin", systemImage: "bitcoinsign.circle.fill")
                    }
                    .tag(Tab.bitcoin)

                Text("Wallet view")
                    .tabItem {
                        Label("Wallet", systemImage: "bag.fill.badge.plus")
                    }
                    .tag(Tab.wallet)
                
                AboutView()
                    .tabItem {
                        Label("About", systemImage: "info.circle.fill")
                    }
                    .tag(Tab.about)
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
