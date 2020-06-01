//
//  FeedViewController.swift
//  VKFeed
//
//  Created by Alex Tregubov on 01.06.2020.
//  Copyright © 2020 Alex Tregubov. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.getFeed()
        view.backgroundColor = .systemBlue
    }
    
}
