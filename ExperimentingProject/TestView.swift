//
//  TestView.swift
//  ExperimentingProject
//
//  Created by Maertens Yann-Christophe on 30/03/22.
//

import SwiftUI

struct TestView: View {
    @State private var isAnimating = false
    @Namespace private var namespace
    var body: some View {
        VStack {
            if !isAnimating {
                Button(action: {
                    withAnimation { isAnimating.toggle() }
                }) {
                    Rectangle()
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                        .frame(width: 100, height: 100)
                }
            }
            
            Spacer()
            
            if isAnimating {
                Button(action: {
                    withAnimation { isAnimating.toggle() }
                }) {
                    Rectangle()
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                        .frame(width: isAnimating ? 300 : 100, height: isAnimating ? 300 : 100)
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
