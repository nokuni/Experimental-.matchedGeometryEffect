//
//  UserContentScrollView.swift
//  ExperimentingProject
//
//  Created by Maertens Yann-Christophe on 30/03/22.
//

import SwiftUI

struct UserContentScrollView: View {
    @State private var offset = CGFloat.zero
    var user: User
    var preferenceKey: some View {
        GeometryReader {
            Color
                .clear
                .preference(key: ViewOffsetKey.self,
                            value: -$0.frame(in: .named("scroll")).origin.y)
        }
    }
    var updateScroll: ((CGFloat) -> Void)?
    var body: some View {
        ScrollView(showsIndicators: false) {
            UserContentListView(user: user)
                .background(preferenceKey)
                .onPreferenceChange(ViewOffsetKey.self) {
                    updateScroll?($0)
                }
        }
        .coordinateSpace(name: "scroll")
    }
}

struct UserContentScrollView_Previews: PreviewProvider {
    static var previews: some View {
        UserContentScrollView(user: User.maria)
    }
}
