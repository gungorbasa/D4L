//
//  MockPostListService.swift
//  D4LTests
//
//  Created by Gungor Basa on 6/13/21.
//

import Foundation
@testable import D4L

final class MockPostListService: PostListServing {
  var isCalled = false

  func make(completion: @escaping (Result<[Post], Error>) -> Void) {
    isCalled = true
  }
}
