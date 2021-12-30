//
//  Sidebar.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 30/12/21.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        List {
            NavigationLink(destination: BitcoinView()) {
                Label("Bitcoin", systemImage: "bitcoinsign.circle.fill")
            }
            
            NavigationLink(destination: Text("Wallet view")) {
                Label("Wallet", systemImage: "bag.fill.badge.plus")
            }
            
            NavigationLink(destination: AboutView()) {
                Label("About", systemImage: "info.circle.fill")
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Categories")
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
