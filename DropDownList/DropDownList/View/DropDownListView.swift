//
//  DropDownListView.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct DropDownListView: View {
    @EnvironmentObject private var dropDownManager: DropDownManager
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(dropDownManager.items.indices, id: \.self) {
                        DropDownRowView(item: dropDownManager.items[$0])
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 30)
            }
            .onAppear { generateOpinions(count: 20) }
        }
    }
    
    private func generateOpinions(count: Int) {
        (0..<count).forEach { _ in
            let numberOfDescriptions = Int.random(in: 2...20)
            let randomDescriptions = (0..<numberOfDescriptions).map { _ in
                DescriptionOpinion(title: "Opinion \(Int.random(in: 2...100))")
            }
            dropDownManager.items.append(Opinion(descriptions: randomDescriptions))
        }
    }
}

#Preview {
    ContentView()
}

