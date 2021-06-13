//
//  UITableViewCell.swift
//  D4L
//
//  Created by Gungor Basa on 6/13/21.
//

import UIKit

extension UITableViewCell {
  /// Returns cell's reuse identifier
  static var identifier: String {
    return String(describing: self)
  }
}
