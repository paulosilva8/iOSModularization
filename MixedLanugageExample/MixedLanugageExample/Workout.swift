//
//  Workout.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 05/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Foundation

struct Workout: Decodable, Hashable {
    let title: String
    let duration: String
    let imageURL: URL?
    let isRecommended: Bool
}

extension Workout: Identifiable {
    var id: String { title }
}

extension Workout {
    static let sample = Self(
        title: "GAIN MUSCLE WITHOUT ANY WEIGHTS",
        duration: "12 weeks",
        imageURL: nil,
        isRecommended: true
    )
}
