//
//  File.swift
//  
//
//  Created by Paulo Silva on 16/09/2022.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
