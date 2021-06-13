//
//  PostListService.swift
//  D4L
//
//  Created by Gungor Basa on 6/13/21.
//

import Foundation
import Networking

protocol PostListServing {
  func make(completion: @escaping (Result<[Post], Error>) -> Void)
}

struct PostListService: PostListServing {
  let networking: Networking

  func make(completion: @escaping (Result<[Post], Error>) -> Void) {
    networking.run(PostsNetworkRoutes.posts, completion: completion)
  }
}
