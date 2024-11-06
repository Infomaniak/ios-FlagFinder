//
//  FlagView.swift
//  FlagFinder
//
//  Created by Ambroise Decouttere on 24/06/2024.
//

import SwiftUI

struct FlagView: View {
    let countryCode: String

    var body: some View {
        Image(countryCode)
            .resizable()
            .aspectRatio(1.5, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
    }
}

#Preview {
    FlagView(countryCode: "ck")
}
