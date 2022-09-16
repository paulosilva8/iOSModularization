//
//  GitHubSearchItem+ViewModel.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Foundation
import Utilities

extension GithubSearchModel.Item {
    var searchListCellViewModel: SearchListCellViewModel {
        let watchers = SharedNumberFormatter.shared.format(watchers)
        let forks = SharedNumberFormatter.shared.format(forks)
        return SearchListCellViewModel(
            title: fullName,
            description: description,
            footer: "watchers: \(watchers), forks: \(forks)"
        )
    }
}
