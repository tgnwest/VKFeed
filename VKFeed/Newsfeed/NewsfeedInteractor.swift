//
//  NewsfeedInteractor.swift
//  VKFeed
//
//  Created by Alex Tregubov on 02.06.2020.
//  Copyright (c) 2020 Alex Tregubov. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    
    switch request {
    case .some:
        print(".some Interactor")
    case .getFeed:
        print(".getFeed Interactor")
        presenter?.presentData(response: .presentNewsfeed)
    }
  }
  
}
