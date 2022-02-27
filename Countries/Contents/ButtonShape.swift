//
//  ButtonShape.swift
//  Countries
//
//  Created by Batuhan Mıcık on 26.02.2022.
//

import SwiftUI

struct Buttons: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.4))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
