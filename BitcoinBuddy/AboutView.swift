//
//  AboutView.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 17/12/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        Form {
            Section(header: Text("Social")) {
                HStack {
                    Image("TwitterLogo")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Link("Twitter", destination: URL(string: "https://twitter.com/dennisconcep")!)
                }
            }
            
            Section(header: Text("About us"), footer: Text("Open Source App made by Dennis Concepción")) {
                Link("Bitcoin Buddy Web", destination: URL(string: "https://bitcoinbuddy.app")!)
                Link("Dennis Tech Web", destination: URL(string: "https://dennistech.io")!)
                Link("Source code", destination: URL(string: "https://github.com/denniscm190/bitcoin-buddy")!)
            }
        }
        .navigationTitle("About")
        .if(UIDevice.current.userInterfaceIdiom == .phone) { content in
            NavigationView { content }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
