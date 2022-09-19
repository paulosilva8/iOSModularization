//
//  RepositoryListRouter.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//


import UIKit
import Utilities

final class RepositoryListRouter {
    weak var viewController: UIViewController?
    
    var delegate: RepositoryListRouterDelegate
    
    init(delegate: RepositoryListRouterDelegate) {
        self.delegate = delegate
    }

    func showRepositoryDetailsPage(with item: GithubSearchModel.Item) {
        delegate.showRepositoryDetailsView(item: item, viewController: viewController)
    }
}
