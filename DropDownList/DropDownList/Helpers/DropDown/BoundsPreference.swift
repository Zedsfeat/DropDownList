//
//  BoundsPreference.swift
//  DropDownList
//
//  Created by Rishat Zinatullin on 02.12.2023.
//

import SwiftUI

struct BoundsPreference: PreferenceKey {
    static var defaultValue: [String: Anchor<CGRect>] = [:]
    
    static func reduce(
        value: inout [String : Anchor<CGRect>],
        nextValue: () -> [String : Anchor<CGRect>]
    ) {
        value.merge(nextValue()){$1}
    }
}
