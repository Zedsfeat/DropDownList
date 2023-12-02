//
//  DropDownMenuView.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct DropDownMenuView: View {
    @EnvironmentObject private var dropDownManager: DropDownManager
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 4) {
                    ForEach(dropDownManager.selectedDescriptions.indices, id: \.self) { index in
                        Button {
                            swapElements(index: index)
                            dropDownManager.selectedItem = nil
                        } label: {
                            Text("\(dropDownManager.selectedDescriptions[index].title)")
                                .font(.system(.headline, weight: .regular))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .buttonStyle(DropDownButtonStyle())
                    }
                }
                .padding(2)
                .id("topId")
            }
            .frame(width: UIScreen.main.bounds.width - 60)
            .background(getBackground(isShadowed: true))
            .frame(height: dropDownManager.selectedDescriptions.count > 4 ? 210 : nil)
            .fixedSize(horizontal: false, vertical: true)
            .onAppear { proxy.scrollTo("topId", anchor: .top) }
        }
    }
    
    private func getBackground(isShadowed: Bool = false) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1)
                .fill(Color(.systemGray3))
        }
        .shadow(color: .black.opacity(isShadowed ? 0.1 : 0), radius: 5)
    }
    
    private func swapElements(index: Int) {
        guard index > 0 && index <= dropDownManager.selectedDescriptions.count else { return }
        let firstElement = dropDownManager.selectedDescriptions[0]
        dropDownManager.selectedDescriptions[0] = dropDownManager.selectedDescriptions[index]
        dropDownManager.selectedDescriptions[index] = firstElement
    }
}

#Preview {
    ContentView()
}
