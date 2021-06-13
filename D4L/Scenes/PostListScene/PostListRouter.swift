//
//  PostListRouter.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class PostListRouter: PostListRouterProtocol {
  
  unowned let view: UIViewController
  
  init(_ view: UIViewController) {
    self.view = view
  }
  
  func navigate(to route: PostListRoute) {
    
  }
}
