//
//  PostListBuilder.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Networking
import UIKit

final class PostListBuilder {
  
  static func make() -> PostListViewController {
    let view = PostListViewController()
    let router = PostListRouter(view)
    let service = PostListService(networking: NativeNetwork(decoder: JSONDecoder()))
    let interactor = PostListInteractor(service: service)
    let presenter = PostListPresenter(view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}
