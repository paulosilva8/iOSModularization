//
//  RepositoryListViewController.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit

final class RepositoryListViewController: UIViewController {
    private lazy var githubSearchController: GithubSearchController = {
        let githubSearchController = GithubSearchController(navigationItem: navigationItem)
        return githubSearchController
    }()

    private lazy var refreshController: RefreshController = {
        let refreshController = RefreshController(tableView: tableView)
        refreshController.onRefresh = { [weak self] in
            guard let self = self else {
                return
            }
            self.viewModel.search(keyword: self.githubSearchController.keyword)
        }
        return refreshController
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(
            SearchListCell.self,
            forCellReuseIdentifier: SearchListCell.reuseIdentifier
        )
        tableView.register(
            LoadingCell.self,
            forCellReuseIdentifier: LoadingCell.reuseIdentifier
        )
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    private let router: RepositoryListRouter
    private let viewModel: RepositoryListViewModel

    init(
        router: RepositoryListRouter,
        viewModel: RepositoryListViewModel
    ) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBinded()
        githubSearchController.defaultSearch()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }

    private func setupView() {
        title = viewModel.title
        view.backgroundColor = UIColor.blue
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupBinded() {
        githubSearchController.onKeywordSearched = { [weak self] keyword in
            self?.viewModel.search(keyword: keyword)
        }
        viewModel.onSearchLoaded = { [weak self] result in
            self?.tableView.reloadData()
        }
        viewModel.onStatusChangedObservers.append(contentsOf: [
            githubSearchController.searchStatusChanged(_:),
            refreshController.searchStatusChanged(_:)
        ])
    }
}

extension RepositoryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = viewModel.searchItemAt(indexPath.row) else {
            assertionFailure(
                "Search model item for index \(indexPath.row) shouldn't be empty"
            )
            return
        }
        router.showRepositoryDetailsPage(with: item)
    }
}

extension RepositoryListViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.numberOfRows + (viewModel.hasNextPage ? 1 : 0)
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        switch indexPath.row {
        case 0..<viewModel.numberOfRows:
            guard
                let viewModel = viewModel.cellViewModelAt(indexPath.row),
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: SearchListCell.reuseIdentifier,
                    for: indexPath
                ) as? SearchListCell
            else {
                assertionFailure(
                    "Should be able to create `SearchListCell`"
                )
                return UITableViewCell()
            }

            cell.configure(with: viewModel)
            return cell
        case viewModel.numberOfRows:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LoadingCell.reuseIdentifier,
                    for: indexPath
                ) as? LoadingCell
            else {
                assertionFailure(
                    "Should be able to create `LoadingCell`"
                )
                return UITableViewCell()
            }
            cell.configure()
            viewModel.onStatusChangedObservers.append(
                cell.searchStatusChanged(_:)
            )
            viewModel.loadNextPage()
            return cell
        default:
            assertionFailure(
                "index \(indexPath.row) should between 0 to \(viewModel.numberOfRows)"
            )
            return UITableViewCell()
        }
    }
}

