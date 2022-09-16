//
//  SharedDateFormatter.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 15/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Foundation

final class SharedDateFormatter {
    static let shared = SharedDateFormatter()
    private init() {}

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

    func format(_ date: Date?) -> String {
        guard let date = date else {
            return "--"
        }
        return dateFormatter.string(from: date)
    }
}
