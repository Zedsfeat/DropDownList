//
//  DropDownListView.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct DropDownListView: View {
    @Environment(\.isEnabled) private var isEnabled
    @State private var opinions: [Opinion] = []
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(opinions.indices, id: \.self) { index in
                        DropDownRowView(
                            opinion: opinions[index],
                            proxy: proxy
                        )
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 30)
            }
            .background(.white)
            .onAppear { generateOpinions(count: 100) }
        }
    }
    
    private func generateOpinions(count: Int) {
        (0..<count).forEach { _ in
            let numberOfDescriptions = Int.random(in: 2...20)
            let randomDescriptions = (0..<numberOfDescriptions).map { _ in
                DescriptionOpinion(title: "Opinion \(Int.random(in: 2...100))")
            }
            opinions.append(Opinion(descriptionOpinions: randomDescriptions))
        }
    }
}
