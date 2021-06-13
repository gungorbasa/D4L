//
//  PostCommentFactory.swift
//  D4L
//
//  Created by Gungor Basa on 6/13/21.
//

import Foundation

protocol PostCommentViewModelFactoring {
  func create(with comments: [Comment]) -> [PostCommentViewModel]
}

struct PostCommentViewModelFactory: PostCommentViewModelFactoring {
  func create(with comments: [Comment]) -> [PostCommentViewModel] {
    comments.map { PostCommentViewModel(name: $0.name, email: $0.email, body: $0.body) }
  }
}
