//
//  UIViewExtension.swift
//  D4L
//
//  Created by Gungor Basa on 6/13/21.
//

import UIKit

extension UIView {
  /// Initializes autolayout `view` instance
  class func autolayoutView() -> Self {
    let instance = self.init()
    instance.translatesAutoresizingMaskIntoConstraints = false
    return instance
  }

  /// Tranforms existing view into autolayout
  func autolayoutView() -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    return self
  }

  func pinToSuperView() {
    guard let superview = superview else { return }
    translatesAutoresizingMaskIntoConstraints = false

    topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
    leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
    bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
  }

  ///Constraints a view to its superview safe area
  func pinToSafeArea() {
    guard let superview = superview else { return }
    translatesAutoresizingMaskIntoConstraints = false

    topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
    leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor).isActive = true
    bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
    rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor).isActive = true
  }
}
