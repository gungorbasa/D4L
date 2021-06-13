//
//  PostListViewModelFactory.swift
//  D4L
//
//  Created by Gungor Basa on 6/13/21.
//

import Foundation

protocol PostListViewModelFactoring {
  func create(from posts: [Post]) -> [PostListViewModel]
}

struct PostListViewModelFactory: PostListViewModelFactoring {
  func create(from posts: [Post]) -> [PostListViewModel] {
    posts.map { PostListViewModel(title: $0.title, body: $0.body) }
  }
}
