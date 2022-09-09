//
//  RefreshController.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit

final class RefreshController: NSObject {
    var onRefresh: (() -> Void)?

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()

    init(tableView: UITableView) {
        super.init()
        tableView.refreshControl = refreshControl
    }

    @objc func refresh() {
        onRefresh?()
    }

    func searchStatusChanged(_ status: RepositoryListViewModel.SearchStatus) {
        switch status {
        case .wait:
            break
        case .searching:
            refreshControl.beginRefreshing()
        case .done, .fail:
            refreshControl.endRefreshing()
        }
    }
}
