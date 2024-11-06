//
//  Helper.swift
//  FlagFinder
//
//  Created by Ambroise Decouttere on 24/06/2024.
//

import Foundation

func wait(_ duration: CGFloat, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        completion()
    }
}


