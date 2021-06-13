//
//  PostListPresenter.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class PostListPresenter: PostListPresenterProtocol {
  
  private unowned let view: PostListViewProtocol
  
  private let interactor: PostListInteractorProtocol
  private let router: PostListRouterProtocol
  
  init(_ view: PostListViewProtocol, interactor: PostListInteractorProtocol, router: PostListRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
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
      print(posts)
//      view.handleOutput(<#T##output: PostListPresenterOutput##PostListPresenterOutput#>)
    case .error:
      DispatchQueue.main.async {
        self.router.navigate(to: .alert(title: "Error", message: "An Error Occurred. Please, try again!"))
      }
    }
  }
}
