//
//  MockPostListRouter.swift
//  D4LTests
//
//  Created by Gungor Basa on 6/13/21.
//

import Foundation
@testable import D4L

final class MockPostListRouter: PostListRouterProtocol {
  var route: PostListRoute?

  func navigate(to route: PostListRoute) {
    self.route = route
  }
}
