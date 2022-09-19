//
//  RepositoryListRouterDelegate.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 19/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit
import Listing
import Details
import Utilities

final class RepositoryListRouterDelegate: Listing.RepositoryListRouterDelegate {
    func showRepositoryDetailsView(item: GithubSearchModel.Item, viewController: UIViewController?) {
        let detailsVC = Details.UIFactory.repositoryDetailsViewController(item: item)
        viewController?.show(detailsVC, sender: nil)
    }
}
