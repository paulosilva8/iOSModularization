//
//  APIManager.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Foundation
import Resolver

final class APIManager {
    //static let shared = APIManager()
    private struct UnknownError: Error {}
    init() {}

    typealias Result = Swift.Result<(Data, URLResponse), Error>

    func request(_ request: URLRequest, completion: @escaping (Result) -> Void ) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            completion(Result {
                if let error = error {
                    throw error
                } else if let data = data, let response = response {
                    return (data, response)
                } else {
                    throw UnknownError()
                }
            })
        }.resume()
    }
}
