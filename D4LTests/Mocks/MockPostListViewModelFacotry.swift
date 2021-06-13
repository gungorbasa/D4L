//
//  MockPostListViewModelFacotry.swift
//  D4LTests
//
//  Created by Gungor Basa on 6/13/21.
//

import Foundation
@testable import D4L

final class MockPostListViewModelFactory: PostListViewModelFactoring {
  var isCreateCalled = false
  var result: [PostListViewModel] = []

  func create(from posts: [Post]) -> [PostListViewModel] {
    isCreateCalled = true
    return result
  }
}
