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
  private let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    presenter.onViewDidLoad()
  }

  override func loadView() {
    view = tableView
  }
}

extension PostListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.numberOfRows()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let viewModel = presenter.viewModelAt(index: indexPath.row) else { return UITableViewCell() }
    let cell = tableView.dequeueReusableCell(PostListCell.self, for: indexPath)
    cell.configure(with: viewModel)
    return cell
  }
}

extension PostListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.didSelect(at: indexPath.row)
  }
}

private extension PostListViewController {
  func setup() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(cell: PostListCell.self)
    tableView.separatorStyle = .none
  }
}

extension PostListViewController: PostListViewProtocol {
  
  func handleOutput(_ output: PostListPresenterOutput) {
    switch output {
    case .reload:
      tableView.reloadData()
    }
  }
}
