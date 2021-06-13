//
//  PostDetailsContracts.swift
//  D4L
//
//  Created Gungor Basa on 6/13/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol PostDetailsInteractorProtocol: AnyObject {
  
  var delegate: PostDetailsInteractorDelegate? { get set }
}

enum PostDetailsInteractorOutput {
  
}

protocol PostDetailsInteractorDelegate: AnyObject {
  
  func handleOutput(_ output: PostDetailsInteractorOutput)
}

// MARK: - Presenter
protocol PostDetailsPresenterProtocol: AnyObject {
  
}

enum PostDetailsPresenterOutput: Equatable {
  
}

// MARK: - View
protocol PostDetailsViewProtocol: AnyObject {
  
  func handleOutput(_ output: PostDetailsPresenterOutput)
}

// MARK: - Router
enum PostDetailsRoute: Equatable {
  
}

protocol PostDetailsRouterProtocol: AnyObject {
  
  func navigate(to route: PostDetailsRoute)
}