//
//  UserContentListView.swift
//  ExperimentingProject
//
//  Created by Maertens Yann-Christophe on 30/03/22.
//

import SwiftUI

struct UserContentListView: View {
    var user: User
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(user.content) { content in
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Image(user.image)
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                        Text(content.title)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .background(Color(UIColor.systemGray5))
                    Image(content.image)
                        .resizable()
                        .scaledToFit()
                    ForEach(content.comments) { comment in
                        CommentView(comment: comment)
                    }
                    .padding(.leading)
                }
            }
        }
    }
}

struct UserContentListView_Previews: PreviewProvider {
    static var previews: some View {
        UserContentListView(user: User.maria)
    }
}
