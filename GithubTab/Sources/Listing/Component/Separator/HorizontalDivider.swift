//
//  HorizontalDivider.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit

final class HorizontalDivider: UIView {
    var height: CGFloat = 1 {
        didSet {
            layer.cornerRadius = height / 2
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = UIColor.gray
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: height)
    }
}
