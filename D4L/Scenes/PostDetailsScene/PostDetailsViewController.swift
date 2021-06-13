//
//  PostDetailsViewController.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class PostDetailsViewController: UIViewController {
  
  var presenter: PostDetailsPresenterProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  private func setup() {
    
  }
}

extension PostDetailsViewController: PostDetailsViewProtocol {
  
  func handleOutput(_ output: PostDetailsPresenterOutput) {
    
  }
}
