//
//  DropDownManager.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import Foundation

class DropDownManager: ObservableObject {
    @Published var items: [Opinion] = []
    @Published var selectedItem: Opinion?
    @Published var selectedDescriptions: [DescriptionOpinion] = []
}
