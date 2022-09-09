//
//  JSONDecoder+DateStrategy.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Foundation

extension JSONDecoder {
    convenience init(dateStrategy: DateDecodingStrategy) {
        self.init()
        dateDecodingStrategy = dateStrategy
    }
}
