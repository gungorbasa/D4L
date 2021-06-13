//
//  PostListFactoryTests.swift
//  D4LTests
//
//  Created by Gungor Basa on 6/13/21.
//

import XCTest
@testable import D4L

class PostListViewModelFactoryTests: XCTestCase {
  private let factory = PostListViewModelFactory()

  func testCreate() throws {
    let input: [Post] = [
      .init(id: 1, title: "Title1", body: "Body1"),
      .init(id: 2, title: "Title2", body: "Body2"),
      .init(id: 3, title: "Title3", body: "Body3")
    ]

    let viewModels = factory.create(from: input)

    XCTAssertTrue(viewModels.count == 3, "Should create 3 viewModels")

    XCTAssertTrue(viewModels[0].id == 1, "Wrong id")
    XCTAssertTrue(viewModels[0].title == "Title1", "Wrong title")
    XCTAssertTrue(viewModels[0].body == "Body1", "Wrong body")

    XCTAssertTrue(viewModels[1].id == 2, "Wrong id")
    XCTAssertTrue(viewModels[1].title == "Title2", "Wrong title")
    XCTAssertTrue(viewModels[1].body == "Body2", "Wrong body")

    XCTAssertTrue(viewModels[2].id == 3, "Wrong id")
    XCTAssertTrue(viewModels[2].title == "Title3", "Wrong title")
    XCTAssertTrue(viewModels[2].body == "Body3", "Wrong body")
  }
}
