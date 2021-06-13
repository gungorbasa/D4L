//
//  PostListCell.swift
//  D4L
//
//  Created by Gungor Basa on 6/13/21.
//

import UIKit

final class PostListCell: UITableViewCell {
  private lazy var stackView = UIStackView.autolayoutView()
  private let title = UILabel()
  private let detail = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with viewModel: PostListViewModel) {
    title.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
    title.text = viewModel.title

    detail.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
    detail.text = viewModel.body
    detail.numberOfLines = 2
  }

  private func setup() {
    stackView.axis = .vertical
    stackView.addArrangedSubview(title)
    stackView.addArrangedSubview(detail)

    contentView.addSubview(stackView)
    stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    stackView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
    stackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    stackView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
  }
}
