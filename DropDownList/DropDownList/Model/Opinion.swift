//
//  Opinion.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import Foundation

struct Opinion: Identifiable, Equatable {
    let id = UUID().uuidString
    var descriptions: [String]
}
