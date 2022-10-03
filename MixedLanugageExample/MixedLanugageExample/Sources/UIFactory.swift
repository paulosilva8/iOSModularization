//
//  UIFactory.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 14/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit
import Listing
import Resolver

final class UIFactory {
    @Injected private var externalClass: ClassExternalProtocol
    private init() {}
    
    static func repositoryListViewController() -> RepositoryListViewController {
        UIFactory().createExternal()
        let delegate = RepositoryListRouterDelegate()
        return Listing.UIFactory.repositoryListViewController(delegate: delegate)
    }
    
    func createExternal() {
        externalClass.printName()
    }
    
//    static func repositoryListViewController() -> RepositoryListViewController {
//        Listing.UIFactory.repositoryListViewController()
//    }
////    static func repositoryDetailsViewController(
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