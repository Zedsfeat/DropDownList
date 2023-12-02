//
//  Opinion.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import Foundation

struct Opinion: Identifiable {
    let id = UUID().uuidString
    let descriptions: [DescriptionOpinion]
}

struct DescriptionOpinion {
    let title: String
}
