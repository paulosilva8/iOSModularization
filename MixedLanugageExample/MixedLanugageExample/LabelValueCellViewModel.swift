//
//  LabelValueCellViewModel.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Foundation
import UIKit

struct LabelValueCellViewModel {
    let label: String
    let value: String
    let isLinkAttributed: Bool

    var valueAttributedText: NSAttributedString {
        if isLinkAttributed {
            return NSAttributedString(
                string: value,
                attributes: [.link : value]
            )
        } else {
            return NSAttributedString(string: value)
        }
    }
}
