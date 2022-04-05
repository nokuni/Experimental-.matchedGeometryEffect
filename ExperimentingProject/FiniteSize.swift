//
//  FiniteSize.swift
//  ExperimentingProject
//
//  Created by Maertens Yann-Christophe on 30/03/22.
//

import SwiftUI

// Property wrapper to limit a size value

@propertyWrapper
struct FiniteSize {
    var size: CGFloat
    var minimum: CGFloat
    var wrappedValue: CGFloat {
        get { return size }
        set { size = max(newValue, UIScreen.main.bounds.width * 0.25) }
    }
    
    init() {
        size = UIScreen.main.bounds.width * 0.4
        minimum = UIScreen.main.bounds.width * 0.25
    }
    
    init(wrappedValue: CGFloat) {
        minimum = UIScreen.main.bounds.width * 0.25
        size = max(minimum, wrappedValue)
    }
    init(wrappedValue: CGFloat, minimum: CGFloat) {
        self.minimum = minimum
        size = max(minimum, wrappedValue)
    }
}
