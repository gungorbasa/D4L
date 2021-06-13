//
//  PostDetailsBuilder.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Networking
import UIKit

final class PostDetailsBuilder {

  // Since we have the full information about post from here, I just passed viewModel instead of
  // using service to get info for it
  static func make(with viewModel: PostListViewModel) -> PostDetailsViewController {
    let view = PostDetailsViewController()
    let router = PostDetailsRouter(view)
    let service = PostCommentsService(networking: NativeNetwork(decoder: JSONDecoder()))
    let interactor = PostDetailsInteractor(service: service)
    let presenter = PostDetailsPresenter(view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}
