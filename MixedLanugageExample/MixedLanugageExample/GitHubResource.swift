//
//  GitHubResource.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Foundation

enum GithubResource {
    static let perPage = 30
    case search(keyword: String, page: Int)

    func path() -> String {
        switch self {
        case let .search(keyword, page):
            return "https://api.github.com/search/repositories?q=\(keyword)&page=\(page)&per_page=\(GithubResource.perPage)"
        }
    }

    func url() -> URL  {
        URL(string: path())!
    }

    func request() -> URLRequest {
        URLRequest(url: url())
    }
}
