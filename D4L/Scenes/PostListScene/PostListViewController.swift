//
//  PostListViewController.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class PostListViewController: UIViewController {
  
  var presenter: PostListPresenterProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    presenter.onViewDidLoad()
  }
  
  private func setup() {
    
  }
}

extension PostListViewController: PostListViewProtocol {
  
  func handleOutput(_ output: PostListPresenterOutput) {
    switch output {
    case .posts(let viewModels):
      print(viewModels)
    }
  }
}
