//
//  CommentView.swift
//  ExperimentingProject
//
//  Created by Maertens Yann-Christophe on 30/03/22.
//

import SwiftUI

struct CommentView: View {
    var comment: UserComment
    var body: some View {
        HStack {
            Image(comment.user.image)
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            Text(comment.user.username)
                .fontWeight(.bold)
            Text(comment.message)
                .padding()
        }
        .padding(.vertical)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: UserComment(user: User.maria, message: "Message"))
    }
}
