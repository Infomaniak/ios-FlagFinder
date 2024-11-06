//
//  HeaderView.swift
//  FlagFinder
//
//  Created by Ambroise Decouttere on 30/10/2024.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject private var gameManager: GameManager

    var body: some View {
        HStack {
            HStack {
                Image("flag")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .padding(6)
                    .foregroundStyle(.tint)
                    .background(.iconBackground, in: .rect(cornerRadius: 6))

                Text("Flag Finder")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundStyle(.tint)
            }

            Spacer()

            Button {
                gameManager.restart()
            } label: {
                Label {
                    Text("Restart")
                } icon: {
                    Image(systemName: "arrow.counterclockwise")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.greyElephant, in: .capsule.stroke())
            }
        }
    }
}

#Preview {
    HeaderView()
}
