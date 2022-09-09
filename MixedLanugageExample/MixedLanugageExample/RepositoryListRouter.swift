//
//  RepositoryListRouter.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//


import UIKit

final class RepositoryListRouter {
    weak var viewController: UIViewController?

    func showRepositoryDetailsPage(with item: GithubSearchModel.Item) {
        let detailsViewController = UIFactory.repositoryDetailsViewController(item: item)
        viewController?.show(detailsViewController, sender: nil)
    }
}
