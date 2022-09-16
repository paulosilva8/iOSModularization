//
//  GitHubSearchModel.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Foundation

public struct GithubSearchModel {
    var total: Int
    var items: [Item]

    public struct Item {
        var id: Int
        var name: String
        var owner: String
        var fullName: String
        var description: String
        var language: String
        var forks: Int
        var watchers: Int
        var openIssues: Int
        var url: String
        var homePage: String
        var license: String
        var createdAt: Date?
        var updatedAt: Date?
    }
}
