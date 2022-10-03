//
//  WorkoutsService.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 05/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Combine
import Foundation

struct WorkoutsService {
    let loadWorkouts: () -> AnyPublisher<[Workout], Error>
}

#if DEBUG
extension WorkoutsService {
    static let happyPath = Self {
        Just([.sample, .sample, .sample])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    static let loading = Self {
        Empty(completeImmediately: false)
            .eraseToAnyPublisher()
    }
}
#endif
