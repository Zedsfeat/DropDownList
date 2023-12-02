//
//  Opinion.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import Foundation

struct Opinion: Identifiable {
    let id = UUID()
    let descriptionOpinions: [DescriptionOpinion]
}

struct DescriptionOpinion {
    let title: String
}
