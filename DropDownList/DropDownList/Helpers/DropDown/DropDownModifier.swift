//
//  DropDownModifier.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 03.12.2023.
//

import SwiftUI

extension View {
    func appearDropDownMenu(
        items: Binding<[Opinion]>,
        selectedItem: Binding<Opinion?>
    ) -> some View {
        modifier(DropDownAppearModifier(
            items: items,
            selectedItem: selectedItem)
        )
    }
    
    func onTapDropDownButton(
        item: Opinion,
        selectedItem: Binding<Opinion?>
    ) -> some View {
        modifier(DropDownTapModifier(
            item: item,
            selectedItem: selectedItem)
        )
    }
}

private struct DropDownAppearModifier: ViewModifier {
    @Binding var items: [Opinion]
    @Binding var selectedItem: Opinion?
    
    func body(content: Content) -> some View {
        content
            .overlayPreferenceValue(BoundsPreference.self) {
                if let id = selectedItem?.id,
                   let preference = $0.first(where: { $0.key == id })
                {
                    GeometryReader {
                        let rect = $0[preference.value]
                        ZStack {
                            Color.clear.frame(
                                width: rect.width,
                                height: rect.height
                            )
                            
                            DropDownMenuView(items: $items, selectedItem: $selectedItem)
                                .offset(y: getOffset(rect: rect))
                        }
                        .offset(x: rect.minX, y: rect.minY)
                    }
                }
            }
    }
    
    private func getOffset(rect: CGRect) -> CGFloat {
        if rect.minY > (UIScreen.main.bounds.height - 400) {
            let count = min(selectedItem?.descriptions.count ?? 0, 4)
            return CGFloat(-(count * Int(rect.height)) - 8)
        } else {
            return rect.height + 8
        }
    }
}

private struct DropDownTapModifier: ViewModifier {
    var item: Opinion
    @Binding var selectedItem: Opinion?
    
    func body(content: Content) -> some View {
        content
            .anchorPreference(
                key: BoundsPreference.self,
                value: .bounds
            ) { [item.id: $0] }
            .onTapGesture {
                if selectedItem == nil {
                    selectedItem = item
                } else {
                    selectedItem = nil
                }
            }
    }
}
