//
//  PostListInteractorTests.swift
//  D4LTests
//
//  Created by Gungor Basa on 6/13/21.
//

import XCTest
@testable import D4L

final class PostListInteractorTests: XCTestCase {
  func testIsServiceCalled() throws {
    let service = MockPostListService()
    let interactor = PostListInteractor(service: service)

    interactor.listPosts()

    XCTAssertTrue(service.isCalled, "Interactor should call make function")
  }
}
