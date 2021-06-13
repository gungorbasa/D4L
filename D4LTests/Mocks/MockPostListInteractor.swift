//
//  MockPostListInteractor.swift
//  D4LTests
//
//  Created by Gungor Basa on 6/13/21.
//

import Foundation
@testable import D4L

final class MockPostListInteractor: PostListInteractorProtocol {
  var isListPostsCalled = false

  var delegate: PostListInteractorDelegate?

  func listPosts() {
    isListPostsCalled = true
  }
}
