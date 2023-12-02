//
//  DropDownRowView.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct DropDownRowView: View {
    let opinion: Opinion
    let proxy: ScrollViewProxy
    @State private var edge: VerticalEdge = .bottom
    @State private var isShowed: Bool = false
    @State private var text: String = ""
    @State private var descriptionOpinions: [DescriptionOpinion] = []
    private var imageName: String { "chevron.\(isShowed ? "up" : "down")" }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Capacity: \(descriptionOpinions.count)")
                .font(.system(.title, weight: .regular))
                .foregroundColor(.black)
                .padding(.horizontal, 8)
            
            HStack {
                Text(descriptionOpinions.first?.title ?? "")
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
            .onTapGesture { isShowed.toggle() }
            .safeAreaInset(edge: edge, spacing: isShowed ? 8 : 0) { if isShowed { dropDownMenu } }
            .fixedSize(horizontal: false, vertical: true)
            .onAppear { descriptionOpinions = opinion.descriptionOpinions }
            .id(opinion.id)
            .background {
                GeometryReader { geo in
                    Color.clear.onChange(of: isShowed) {
                        if $0 {
                            let screenHeight = UIScreen.main.bounds.height / 1.5
                            let minY = geo.frame(in: .global).minY
                            edge = screenHeight < minY ? .top : .bottom
                        }
                        
                        if edge == .top {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                proxy.scrollTo(opinion.id, anchor: .bottom)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private var dropDownMenu: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 4) {
                    ForEach(descriptionOpinions.indices, id: \.self) { index in
                        Button {
                            swapElements(index: index)
                            isShowed = false
                        } label: {
                            Text("\(descriptionOpinions[index].title)")
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
            .background(background)
            .frame(height: descriptionOpinions.count > 4 ? 210 : nil)
            .onAppear { proxy.scrollTo("topId", anchor: .top) }
        }
    }
    
    private var background: some View {
        ZStack {
            Color.white
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1)
                .fill(Color(.systemGray3))
        }
    }
    
    private func swapElements(index: Int) {
        guard index > 0 && index <= descriptionOpinions.count else { return }
        let firstElement = descriptionOpinions[0]
        descriptionOpinions[0] = descriptionOpinions[index]
        descriptionOpinions[index] = firstElement
    }
}
