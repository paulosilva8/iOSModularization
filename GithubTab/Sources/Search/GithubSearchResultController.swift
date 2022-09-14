//
//  GithubSearchResultController.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit

final class GithubSearchResultController: UIViewController {
    var statusTitle: String? {
        didSet {
            titleLabel.text = statusTitle
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        setupView()
    }

    private func setupView() {
        view.backgroundColor = UIColor.gray
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

