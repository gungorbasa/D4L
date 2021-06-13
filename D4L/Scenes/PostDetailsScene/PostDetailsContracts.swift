//
//  PostDetailsContracts.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol PostDetailsInteractorProtocol: AnyObject {
  
  var delegate: PostDetailsInteractorDelegate? { get set }

  func fetchComments(postId: Int)
}

enum PostDetailsInteractorOutput {
  case comments([Comment])
  case error(Error)
}

protocol PostDetailsInteractorDelegate: AnyObject {
  
  func handleOutput(_ output: PostDetailsInteractorOutput)
}

// MARK: - Presenter
protocol PostDetailsPresenterProtocol: AnyObject {
  func numberOfRows() -> Int
  func viewModel(for index: Int) -> PostCommentViewModel?
}

enum PostDetailsPresenterOutput: Equatable {
  case reload
  case configure(title: String, body: String)
}

// MARK: - View
protocol PostDetailsViewProtocol: AnyObject {
  
  func handleOutput(_ output: PostDetailsPresenterOutput)
}

// MARK: - Router
enum PostDetailsRoute: Equatable {
  case alert(title: String, message: String)
}

protocol PostDetailsRouterProtocol: AnyObject {
  
  func navigate(to route: PostDetailsRoute)
}
