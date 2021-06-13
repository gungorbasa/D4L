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

  init(_ view: PostDetailsViewProtocol, interactor: PostDetailsInteractorProtocol, router: PostDetailsRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.interactor.delegate = self
  }
}

extension PostDetailsPresenter: PostDetailsInteractorDelegate {

  func handleOutput(_ output: PostDetailsInteractorOutput) {
    switch output {
    case .comments(let comments):
      print(comments)
    case .error:
      DispatchQueue.main.async {
        self.router.navigate(to: .alert(title: "Error", message: "An Error Occurred. Please, try again!"))
      }
    }
  }
}
