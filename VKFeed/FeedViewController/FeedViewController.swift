//
//  FeedViewController.swift
//  VKFeed
//
//  Created by Alex Tregubov on 01.06.2020.
//  Copyright © 2020 Alex Tregubov. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map({ (feedItem) in
                print(feedItem.date)
            })
        }
    }
    
}
