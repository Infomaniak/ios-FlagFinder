//
//  ContentView.swift
//  FlagFinder
//
//  Created by Ambroise Decouttere on 24/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var gameManager = GameManager()

    var body: some View {
        VStack(spacing: 12) {
            HeaderView()
                .tint(Color.greyOrca)

            Spacer()

            GameView()

            Spacer()

            Image("infomaniak")
                .frame(width: 128, height: 16)
        }
        .padding(.horizontal, 24)
        .environmentObject(gameManager)
    }
}

#Preview {
    ContentView()
}
