//
//  PostListContracts.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol PostListInteractorProtocol: AnyObject {

  var delegate: PostListInteractorDelegate? { get set }

  func listPosts()
}

enum PostListInteractorOutput {
  case posts([Post])
  case error(Error)
}

protocol PostListInteractorDelegate: AnyObject {

  func handleOutput(_ output: PostListInteractorOutput)
}

// MARK: - Presenter
protocol PostListPresenterProtocol: AnyObject {
  func onViewDidLoad()
  func numberOfRows() -> Int
  func viewModelAt(index: Int) -> PostListViewModel?
}

enum PostListPresenterOutput: Equatable {
  case reload
}

// MARK: - View
protocol PostListViewProtocol: AnyObject {

  func handleOutput(_ output: PostListPresenterOutput)
}

// MARK: - Router
enum PostListRoute: Equatable {
  case alert(title: String, message: String)
}

protocol PostListRouterProtocol: AnyObject {

  func navigate(to route: PostListRoute)
}
