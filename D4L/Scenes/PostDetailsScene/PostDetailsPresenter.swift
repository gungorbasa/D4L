//
//  PostDetailsPresenter.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class PostDetailsPresenter: PostDetailsPresenterProtocol {

  private weak var view: PostDetailsViewProtocol?

  private let interactor: PostDetailsInteractorProtocol
  private let router: PostDetailsRouterProtocol
  private let factory: PostCommentViewModelFactoring
  private var viewModels: [PostCommentViewModel] = []

  init(
    _ view: PostDetailsViewProtocol,
    interactor: PostDetailsInteractorProtocol,
    router: PostDetailsRouterProtocol,
    postListViewModel: PostListViewModel,
    factory: PostCommentViewModelFactoring
  ) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.factory = factory
    self.interactor.delegate = self
    view.handleOutput(.configure(title: postListViewModel.title, body: postListViewModel.body))
    interactor.fetchComments(postId: postListViewModel.id)
  }

  func numberOfRows() -> Int { viewModels.count }

  func viewModel(for index: Int) -> PostCommentViewModel? {
    guard viewModels.count > index else { return nil }
    return viewModels[index]
  }
}

extension PostDetailsPresenter: PostDetailsInteractorDelegate {

  func handleOutput(_ output: PostDetailsInteractorOutput) {
    switch output {
    case .comments(let comments):
      let viewModels = factory.create(with: comments)
      DispatchQueue.main.async {
        self.viewModels = viewModels
        self.view?.handleOutput(.reload)
      }
    case .error:
      DispatchQueue.main.async {
        self.router.navigate(to: .alert(title: "Error", message: "An Error Occurred. Please, try again!"))
      }
    }
  }
}
