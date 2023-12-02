//
//  DropDownRowView.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct DropDownRowView: View {
    let item: Opinion
    @EnvironmentObject private var dropDownManager: DropDownManager
    private var condition: Bool { dropDownManager.selectedItem?.id == item.id }
    private var imageName: String { "chevron.\(condition ? "up" : "down")" }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Capacity: \(item.descriptions.count)")
                .font(.system(.title, weight: .regular))
                .padding(.horizontal, 8)
            
            HStack {
                Text(item.descriptions.first?.title ?? "")
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
        }
        .onTapDropDown(item: item)
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

#Preview {
    ContentView()
}
