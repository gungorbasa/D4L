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
  private var contentView = PostDetailsContentView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  override func loadView() {
    view = contentView
  }
  
  private func setup() {
    view.backgroundColor = .white
    contentView.dataSource = self
    contentView.register(cell: PostCommentCell.self)
  }
}

extension PostDetailsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.numberOfRows()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let viewModel = presenter.viewModel(for: indexPath.row) else { return UITableViewCell() }
    let cell = tableView.dequeueReusableCell(PostCommentCell.self, for: indexPath)
    cell.configure(with: viewModel)
    return cell
  }
}


extension PostDetailsViewController: PostDetailsViewProtocol {
  
  func handleOutput(_ output: PostDetailsPresenterOutput) {
    switch output {
    case .reload:
      contentView.reloadTableView()
    case .configure(let title, let body):
      contentView.configure(with: title, details: body)
    }
  }
}
