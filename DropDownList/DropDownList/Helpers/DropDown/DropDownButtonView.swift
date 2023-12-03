//
//  DropDownButtonView.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct DropDownButtonView: View {
    private var imageName: String { "chevron.\(selectedItem == item ? "up" : "down")" }
    var item: Opinion
    @Binding var selectedItem: Opinion?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Capacity: \(item.descriptions.count)")
                .font(.system(.title, weight: .regular))
                .padding(.horizontal, 8)
            
            HStack {
                Text(item.descriptions.first ?? "")
                    .font(.system(.headline, weight: .regular))
                    .foregroundColor(.black)
                
                Spacer(minLength: 8)
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18)
                    .foregroundColor(.black)
            }
            .padding(16)
            .background(background)
            .onTapDropDownButton(item: item, selectedItem: $selectedItem)
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
    }
}
