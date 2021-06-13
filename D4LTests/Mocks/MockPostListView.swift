//
//  MockPostListView.swift
//  D4LTests
//
//  Created by Gungor Basa on 6/13/21.
//

import Foundation
@testable import D4L

final class MockPostListView: PostListViewProtocol {
  var output: PostListPresenterOutput?

  func handleOutput(_ output: PostListPresenterOutput) {
    self.output = output
  }
}
