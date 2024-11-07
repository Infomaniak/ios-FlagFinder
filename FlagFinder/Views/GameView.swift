//
//  GameView.swift
//  FlagFinder
//
//  Created by Ambroise Decouttere on 30/10/2024.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject private var gameManager: GameManager

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("Find the flag :")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.greyElephant)
                Text(countryName(from: gameManager.correctFlag))
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40, weight: .medium))
                    .foregroundStyle(Color.greyOrca)
            }

            VStack(spacing: 13) {
                ForEach(gameManager.flags, id: \.self) { code in
                    let animation = animationFor(flag: code)
                    Button {
                        gameManager.select(flag: code)
                    } label: {
                        FlagView(countryCode: code)
                            .padding(3)
                            .overlay {
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(animation.borderColor, lineWidth: 3)
                            }
                            .opacity(animation.opacity)
                    }
                }
            }

            VStack(spacing: 8) {
                Text("Score : \(gameManager.score)")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundStyle(Color.greyOrca)

                Text("n°\(gameManager.total)/\(Constants.partySize)")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.greyElephant)
            }
        }
        .padding(.vertical, 32)
        .frame(maxWidth: .infinity)
        .background(.skyBackground, in: .rect(cornerRadius: 12))
        .onAppear {
            gameManager.initFlagsToGuess()
        }
    }

    private func animationFor(flag: String) -> animationType {
        guard let answered = gameManager.answered else {
            return .none
        }

        if answered == gameManager.correctFlag { // Correct answer
            guard flag == answered else {
                return .blurred
            }
            return .correct
        } else { // Wrong answer
            if flag == answered {
                return .wrong
            } else if flag == gameManager.correctFlag {
                return .correct
            } else {
                return .blurred
            }
        }
    }

    func countryName(from countryCode: String) -> String {
        return Locale.current.localizedString(forRegionCode: countryCode) ?? countryCode
//        let current = Locale(identifier: "fr")
//        return current.localizedString(forRegionCode: countryCode)
    }
}

#Preview {
    GameView()
        .environmentObject(GameManager())
}
