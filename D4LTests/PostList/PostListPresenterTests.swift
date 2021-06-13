//
//  PostListPresenterTests.swift
//  D4LTests
//
//  Created by Gungor Basa on 6/13/21.
//

import XCTest
@testable import D4L

final class PostListPresenterTests: XCTestCase {
  private var interactor: MockPostListInteractor!
  private var view: MockPostListView!
  private var factory: MockPostListViewModelFactory!
  private var router: MockPostListRouter!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    interactor = MockPostListInteractor()
    view = MockPostListView()
    factory = MockPostListViewModelFactory()
    router = MockPostListRouter()
  }

  
  func testListPostCalled() throws {
    let presenter = PostListPresenter(
      view,
      interactor: interactor,
      factory: factory,
      router: router
    )

    presenter.onViewDidLoad()

    XCTAssertTrue(interactor.isListPostsCalled, "Should call listPost in interactor")
  }

  func testNumberOfRows() throws {
    factory.result = [
      .init(id: 1, title: "Title1", body: "Body1"),
      .init(id: 2, title: "Title2", body: "Body2")
    ]

    let presenter = PostListPresenter(
      view,
      interactor: interactor,
      factory: factory,
      router: router
    )

    interactor.delegate?.handleOutput(.posts([]))
    let expectation = self.expectation(description: "DispatchQueu.main.testNumberOfRows")
    // Call is being made in main thread
    DispatchQueue.main.async {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)

    XCTAssert(presenter.numberOfRows() == 2, "Should have 2 VM created")
  }

  func testViewModelAt() throws {
    factory.result = [
      .init(id: 1, title: "Title1", body: "Body1"),
      .init(id: 2, title: "Title2", body: "Body2")
    ]

    let presenter = PostListPresenter(
      view,
      interactor: interactor,
      factory: factory,
      router: router
    )

    interactor.delegate?.handleOutput(.posts([]))
    let expectation = self.expectation(description: "DispatchQueu.main.testViewModelAt")
    // Call is being made in main thread
    DispatchQueue.main.async {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)

    XCTAssert(presenter.viewModelAt(index: 0) == factory.result[0], "Should be equal to factory.result[0]")
    XCTAssert(presenter.viewModelAt(index: 1) == factory.result[1], "Should be equal to factory.result[1]")
  }

  func testCallRouterProperly() {
    factory.result = [
      .init(id: 1, title: "Title1", body: "Body1"),
      .init(id: 2, title: "Title2", body: "Body2")
    ]

    let presenter = PostListPresenter(
      view,
      interactor: interactor,
      factory: factory,
      router: router
    )
    interactor.delegate?.handleOutput(.posts([]))
    let expectation = self.expectation(description: "DispatchQueu.main.testCallRouterProperly")
    // Call is being made in main thread
    DispatchQueue.main.async {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)

    presenter.didSelect(at: 1)
    XCTAssert(router.route == .detail(viewModel: factory.result[1]), "Should navigate to details")
  }
}
