//
//  ContentView.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dropDownManager = DropDownManager()
    
    var body: some View {
        DropDownListView()
            .onAppearDropDown()
            .environmentObject(dropDownManager)
    }
}

#Preview {
    ContentView()
}

