//
//  PostDetailsInteractor.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class PostDetailsInteractor: PostDetailsInteractorProtocol {
  
  weak var delegate: PostDetailsInteractorDelegate?
  private let service: PostCommentsServing

  init(service: PostCommentsServing) {
    self.service = service
  }

  func fetchComments(postId: Int) {
    service.make(with: "\(postId)") { [weak self] result in
      switch result {
      case .success(let comments):
        self?.delegate?.handleOutput(.comments(comments))
      case .failure(let error):
        self?.delegate?.handleOutput(.error(error))
      }
    }
  }
}
