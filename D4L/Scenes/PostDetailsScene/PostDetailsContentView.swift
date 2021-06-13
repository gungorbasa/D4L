//
//  PostDetailsContentView.swift
//  D4L
//
//  Created by Gungor Basa on 6/13/21.
//

import UIKit

final class PostDetailsContentView: UIView {

  private let containerStackView = UIStackView.autolayoutView()
  private let tableView = UITableView.autolayoutView()
  private let labelStackView = UIStackView.autolayoutView()
  private let titleLabel = UILabel.autolayoutView()
  private let detailsLabel = UILabel.autolayoutView()

  weak var dataSource: UITableViewDataSource? {
    didSet {
      tableView.dataSource = dataSource
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with title: String, details: String) {
    titleLabel.text = title
    detailsLabel.text = details
  }

  func register<T: UITableViewCell>(cell: T.Type) {
    tableView.register(cell: cell)
  }

  func reloadTableView() {
    tableView.reloadData()
  }
}

private extension PostDetailsContentView {
  func setup() {
    setupContainerStackView()
    setupLabelStackView()
    setupTableView()
    setupLabels()
  }

  func setupContainerStackView() {
    addSubview(containerStackView)
    containerStackView.addArrangedSubview(labelStackView)
    containerStackView.addArrangedSubview(tableView)

    containerStackView.axis = .vertical
    containerStackView.alignment = .fill
    containerStackView.distribution = .fill

    containerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    containerStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
    containerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    containerStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
  }

  func setupLabelStackView() {
    labelStackView.addArrangedSubview(titleLabel)
    labelStackView.addArrangedSubview(detailsLabel)
    labelStackView.spacing = 8

    labelStackView.axis = .vertical
    labelStackView.alignment = .fill
    labelStackView.distribution = .fill
  }

  func setupTableView() {
    tableView.separatorStyle = .none
    tableView.dataSource = dataSource
  }

  func setupLabels() {
    titleLabel.numberOfLines = 0
    titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)

    detailsLabel.numberOfLines = 0
    detailsLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
  }
}
