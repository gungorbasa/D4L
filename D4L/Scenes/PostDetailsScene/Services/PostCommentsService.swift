//
//  PostDetailsService.swift
//  D4L
//
//  Created by Gungor Basa on 6/13/21.
//

import Foundation
import Networking

protocol PostCommentsServing {
  func make(with postId: String, completion: @escaping (Result<[Comment], Error>) -> Void)
}

struct PostCommentsService: PostCommentsServing {
  let networking: Networking

  func make(with postId: String, completion: @escaping (Result<[Comment], Error>) -> Void) {
    networking.run(PostsNetworkRoutes.comments(postId: postId), completion: completion)
  }
}

