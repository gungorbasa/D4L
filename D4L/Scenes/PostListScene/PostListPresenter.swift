//
//  PostListPresenter.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class PostListPresenter: PostListPresenterProtocol {
  
  private weak var view: PostListViewProtocol?
  
  private let interactor: PostListInteractorProtocol
  private let router: PostListRouterProtocol
  private let factory: PostListViewModelFactoring
  
  init(
    _ view: PostListViewProtocol,
    interactor: PostListInteractorProtocol,
    factory: PostListViewModelFactoring,
    router: PostListRouterProtocol
  ) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.factory = factory
    self.interactor.delegate = self
  }

  func onViewDidLoad() {
    interactor.listPosts()
  }
}

extension PostListPresenter: PostListInteractorDelegate {
  
  func handleOutput(_ output: PostListInteractorOutput) {
    switch output {
    case .posts(let posts):
      let viewModels = factory.create(from: posts)
      DispatchQueue.main.async {
        self.view?.handleOutput(.posts(viewModels))
      }
    case .error:
      DispatchQueue.main.async {
        self.router.navigate(to: .alert(title: "Error", message: "An Error Occurred. Please, try again!"))
      }
    }
  }
}
