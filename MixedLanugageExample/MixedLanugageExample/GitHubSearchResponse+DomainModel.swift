//
//  GitHubSearchResponse+DomainModel.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Foundation

extension GithubSearchResponse {
    var searchModel: GithubSearchModel {
        GithubSearchModel(
            total: totalCount,
            items: items.map {
                GithubSearchModel.Item(
                    id: $0.id,
                    name: unwrapString($0.name),
                    owner: unwrapString($0.owner.login),
                    fullName: unwrapString($0.fullName),
                    description: unwrapString($0.description),
                    language: unwrapString($0.language),
                    forks: $0.forks ?? 0,
                    watchers: $0.watchers ?? 0,
                    openIssues: $0.openIssuesCount ?? 0,
                    url: unwrapString($0.htmlUrl),
                    homePage: unwrapString($0.homepage),
                    license: unwrapString($0.license?.name),
                    createdAt: $0.createdAt,
                    updatedAt: $0.updatedAt
                )
            }
        )
    }

    func unwrapString(_ value: Optional<String>) -> String {
        switch value {
        case .none:
            return "NA"
        case let .some(unwrapped):
            return unwrapped.isEmpty ? "NA" : unwrapped
        }
    }
}
