//
//  AnimationType.swift
//  FlagFinder
//
//  Created by Ambroise Decouttere on 05/11/2024.
//

import SwiftUI

enum animationType {
    case correct
    case wrong
    case blurred
    case none

    var opacity: Double {
        switch self {
        case .blurred:
            0.6
        default:
            1
        }
    }

    var borderColor: Color {
        switch self {
        case .wrong:
            Color.red
        case .correct:
            Color.green
        default:
            Color.clear
        }
    }
}
