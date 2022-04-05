//
//  InfoView.swift
//  ExperimentingProject
//
//  Created by Maertens Yann-Christophe on 14/12/21.
//

import SwiftUI

struct InfoView: View {
    var user: User
    var size: CGFloat
    @Binding var isChanged: Bool
    @Namespace var namespace
    var body: some View {
        VStack(alignment: .leading) {
            if !isChanged {
                VStack(spacing: 10) {
                    Image(user.image)
                        .resizable()
                        .cornerRadius(15)
                        .matchedGeometryEffect(id: "image", in: namespace)
                        .frame(width: size, height: size)
                    Text(user.username)
                        .matchedGeometryEffect(id: "username", in: namespace)
                        .font(.system(size: UIScreen.main.bounds.width * 0.05, weight: .bold, design: .default))
                    Text(user.country)
                        .matchedGeometryEffect(id: "country", in: namespace)
                        .font(.system(size: UIScreen.main.bounds.width * 0.05, weight: .semibold, design: .default))
                }
            }
            if isChanged {
                HStack(spacing: 10) {
                    Image(user.image)
                        .resizable()
                        .cornerRadius(15)
                        .matchedGeometryEffect(id: "image", in: namespace)
                        .frame(width: size, height: size)
                    VStack(alignment: .leading) {
                    Text(user.username)
                        .matchedGeometryEffect(id: "username", in: namespace)
                        .font(.system(size: UIScreen.main.bounds.width * 0.05, weight: .bold, design: .default))
                    Text(user.country)
                        .matchedGeometryEffect(id: "country", in: namespace)
                        .font(.system(size: UIScreen.main.bounds.width * 0.05, weight: .bold, design: .default))
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: size * 2)
        .background(Color.white)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(user: User.maria, size: 100, isChanged: .constant(false))
    }
}
