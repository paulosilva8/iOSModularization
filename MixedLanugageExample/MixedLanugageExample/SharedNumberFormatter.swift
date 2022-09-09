//
//  SharedNumberFormatter.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Foundation

final class SharedNumberFormatter {
    static let shared = SharedNumberFormatter()
    private init() {}

    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        formatter.numberStyle = .decimal
        return formatter
    }()

    func format(_ value: Int) -> String {
        let number = NSNumber(value: value)
        return numberFormatter.string(from: number) ?? "\(value)"
    }
}

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
