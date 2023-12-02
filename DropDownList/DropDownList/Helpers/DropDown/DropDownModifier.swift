//
//  DropDownModifier.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

extension View {
    func onAppearDropDown() -> some View {
        modifier(DropDownAppearModifier())
    }
    
    func onTapDropDown(item: Opinion) -> some View {
        modifier(DropDownTapModifier(item: item))
    }
}

private struct DropDownAppearModifier: ViewModifier {
    @EnvironmentObject private var dropDownManager: DropDownManager
    
    func body(content: Content) -> some View {
        content
            .overlayPreferenceValue(BoundsPreference.self) {
                if let selectedItem = dropDownManager.selectedItem,
                   let preference = $0.first(where: { $0.key == selectedItem.id })
                {
                    GeometryReader {
                        let rect = $0[preference.value]
                        DropDownRowView(item: selectedItem)
                            .frame(width: rect.width, height: rect.height)
                            .safeAreaInset(edge: .bottom, spacing: 5.5) {
                                DropDownMenuView()
                            }
                            .offset(x: rect.minX, y: rect.minY)
                    }
                }
            }
    }
}

private struct DropDownTapModifier: ViewModifier {
    @EnvironmentObject private var dropDownManager: DropDownManager
    let item: Opinion
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                if dropDownManager.selectedItem == nil {
                    dropDownManager.selectedItem = item
                    dropDownManager.selectedDescriptions = item.descriptions
                } else {
                    dropDownManager.selectedItem = nil
                    dropDownManager.selectedDescriptions = []
                }
            }
            .anchorPreference(
                key: BoundsPreference.self,
                value: .bounds) {
                [item.id: $0]
            }
    }
}
