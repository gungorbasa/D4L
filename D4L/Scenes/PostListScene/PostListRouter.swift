//
//  PostListRouter.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class PostListRouter: PostListRouterProtocol {
  
  weak var view: UIViewController?
  
  init(_ view: UIViewController) {
    self.view = view
  }
  
  func navigate(to route: PostListRoute) {
    switch route {
    case .alert(let title, let message):
      showAlertView(title: title, message: message)
    }
  }
}

private extension PostListRouter {
  func showAlertView(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    view?.present(alert, animated: true)
  }
}
