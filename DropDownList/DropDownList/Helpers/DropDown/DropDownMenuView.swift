//
//  DropDownMenuView.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct DropDownMenuView: View {
    @Binding var items: [Opinion]
    @Binding var selectedItem: Opinion?
    
    var body: some View {
        if let selectedItem {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 4) {
                    ForEach(selectedItem.descriptions.indices, id: \.self) { index in
                        Button {
                            swapElements(index: index)
                        } label: {
                            Text("\(selectedItem.descriptions[index])")
                                .font(.system(.headline, weight: .regular))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .buttonStyle(DropDownButtonStyle())
                    }
                }
                .padding(2)
            }
            .background(background)
            .frame(height: selectedItem.descriptions.count > 4 ? 210 : nil)
            .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    private var background: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1)
                .fill(Color(.systemGray3))
        }
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
    
    // MARK: Helpers
    
    private func swapElements(index: Int) {
        defer { selectedItem = nil }
        if let firstIndex = items.firstIndex(where: { selectedItem?.id == $0.id }) {
            guard index > 0 && index <= items[firstIndex].descriptions.count else { return }
            let firstElement = items[firstIndex].descriptions[0]
            items[firstIndex].descriptions[0] = selectedItem?.descriptions[index] ?? ""
            items[firstIndex].descriptions[index] = firstElement
        }
    }
}
