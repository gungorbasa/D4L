//
//  PostListInteractor.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class PostListInteractor: PostListInteractorProtocol {
  
  weak var delegate: PostListInteractorDelegate?
  private let service: PostListServing

  init(service: PostListServing) {
    self.service = service
  }
}
