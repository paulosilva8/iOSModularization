//
//  UIFactory.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit

final class UIFactory {
    private init() {}

    static func repositoryListViewController() -> RepositoryListViewController {
        let githubSearchService = GithubSearchService()
        let viewModel = RepositoryListViewModel(
            githubSearchService: githubSearchService
        )
        let router = RepositoryListRouter()
        let viewController = RepositoryListViewController(
            router: router,
            viewModel: viewModel
        )
        router.viewController = viewController
        return viewController
    }

    static func repositoryDetailsViewController(
        item: GithubSearchModel.Item
    ) -> RepositoryDetailsViewController {
        let viewModel = RepositoryDetailsViewModel(
            item: item
        )
        let viewController = RepositoryDetailsViewController(
            viewModel: viewModel
        )
        return viewController
    }
}
