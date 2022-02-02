//
//  WalletView.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 30/12/21.
//

import SwiftUI

struct WalletView: View {
    @State private var testVar = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Hello")
                Text("\(testVar)")
                    .onShake {
                        testVar = Int.random(in: 1..<1000)
                    }
            }
        }
        .padding(.top)
        .navigationTitle("Create a wallet")
        .if(UIDevice.current.userInterfaceIdiom == .phone) { content in
            NavigationView { content }
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
