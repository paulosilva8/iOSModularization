//
//  UITableViewCell+ReuseIdentifier.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
