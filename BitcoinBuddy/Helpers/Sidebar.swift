//
//  Sidebar.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 17/12/21.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        List {
            NavigationLink(destination: BitcoinView()) {
                Label("Convert", systemImage: "arrow.counterclockwise.circle")
            }
            
            NavigationLink(destination: AboutView()) {
                Label("About", systemImage: "info.circle")
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
