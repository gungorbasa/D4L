//
//  PostsNetworkRoutes.swift
//  D4L
//
//  Created by Gungor Basa on 6/13/21.
//

import Foundation
import Networking

enum PostsNetworkRoutes: Routing {
  case posts, comments(postId: String)

  var host: String { "https://jsonplaceholder.typicode.com/" }
  var path: String {
    switch self {
    case .posts:
      return "posts"
    case .comments(let postId):
      return "posts/\(postId)/comments"
    }
  }
  var headers: [String : String] { [:] }
  var parameters: [String : Any] { [:] }
  var body: [String : Any] { [:] }
  var method: HTTPMethod { .get }
}
