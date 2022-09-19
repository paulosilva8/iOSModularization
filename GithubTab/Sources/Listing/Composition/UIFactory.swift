//
//  UIFactory.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit

public final class UIFactory {
    private init() {}

    public static func repositoryListViewController(delegate: RepositoryListRouterDelegate) -> RepositoryListViewController {
        let githubSearchService = GithubSearchService()
        let viewModel = RepositoryListViewModel(
            githubSearchService: githubSearchService
        )
        let router = RepositoryListRouter(delegate: delegate)
        let viewController = RepositoryListViewController(
            router: router,
            viewModel: viewModel
        )
        router.viewController = viewController
        return viewController
    }

//    static func repositoryDetailsViewController(
//        item: GithubSearchModel.Item
//    ) -> RepositoryDetailsViewController {
//        let viewModel = RepositoryDetailsViewModel(
//            item: item
//        )
//        let viewController = RepositoryDetailsViewController(
//            viewModel: viewModel
//        )
//        return viewController
//    }
}
