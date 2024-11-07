//
//  GameManager.swift
//  FlagFinder
//
//  Created by Ambroise Decouttere on 05/11/2024.
//

import SwiftUI

class GameManager: ObservableObject {
    @Published var score = 0
    @Published var total = 0

    @Published var flags: [String] = []
    @Published var correctFlag = ""

    @Published var answered: String?
    @Published var animate = false

    func initFlagsToGuess() {
        guard total < Constants.partySize else {
            return
        }

        answered = nil
        let result = Array(Constants.countryCodes.shuffled().prefix(3))
        withAnimation(.easeInOut) {
            flags = result
            correctFlag = result.shuffled()[0]
        }
    }

    func select(flag: String) {
        guard answered == nil else { return }

        total += 1
        if flag == correctFlag {
            score += 1
        }

        withAnimation {
            answered = flag
        }

        wait(5) {
            self.initFlagsToGuess()
        }
    }

    func restart() {
        score = 0
        total = 0
        initFlagsToGuess()
    }
}
