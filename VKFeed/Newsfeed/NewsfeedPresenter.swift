//
//  NewsfeedPresenter.swift
//  VKFeed
//
//  Created by Alex Tregubov on 02.06.2020.
//  Copyright (c) 2020 Alex Tregubov. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
    switch response {
    case .some:
        print(".some Presenter")
    case .presentNewsfeed:
        print(".presentNewsfeed Presenter")
        viewController?.displayData(viewModel: .displayNewsfeed)
    }
  }
  
}
