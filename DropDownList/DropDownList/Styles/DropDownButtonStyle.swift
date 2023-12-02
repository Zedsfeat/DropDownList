//
//  DropDownButtonStyle.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct DropDownButtonStyle: ButtonStyle {
    @ViewBuilder
    func makeBody(configuration: Configuration) -> some View {
        let background = configuration.isPressed 
        ? Color(.gray.opacity(0.1))
        : .black.opacity(0.001)
        
        configuration
            .label
            .padding(14)
            .background(background)
            .cornerRadius(20)
    }
}
