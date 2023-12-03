//
//  DropDownListView.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct DropDownListView: View {
    @State private var items: [Opinion] = []
    @State private var selectedItem: Opinion?
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(items) {
                        DropDownButtonView(
                            item: $0,
                            selectedItem: $selectedItem
                        )
                    }
                }
                .padding(.vertical, 8)
            }
            .appearDropDownMenu(items: $items, selectedItem: $selectedItem)
            .padding(.horizontal, 30)
            .onAppear { generateOpinions(count: 100) }
        }
    }
    
    // MARK: Helpers
    
    private func generateOpinions(count: Int) {
        (0..<count).forEach { _ in
            let numberOfDescriptions = Int.random(in: 2...20)
            let randomDescriptions = (0..<numberOfDescriptions).map { _ in
                "Opinion \(Int.random(in: 2...100))"
            }
            items.append(Opinion(descriptions: randomDescriptions))
        }
    }
}
