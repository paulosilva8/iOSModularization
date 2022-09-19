//
//  File.swift
//  
//
//  Created by Paulo Silva on 19/09/2022.
//

import UIKit
import Utilities

public protocol RepositoryListRouterDelegate {
    func showRepositoryDetailsView(item: GithubSearchModel.Item, viewController: UIViewController?)
}
