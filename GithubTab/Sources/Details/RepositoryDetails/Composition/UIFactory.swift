//
//  File.swift
//  
//
//  Created by Paulo Silva on 16/09/2022.
//

import Foundation

public final class UIFactory {
    private init() {}

    public static func repositoryDetailsViewController(
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