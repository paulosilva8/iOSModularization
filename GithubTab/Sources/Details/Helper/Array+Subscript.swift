//
//  File.swift
//  
//
//  Created by Paulo Silva on 16/09/2022.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
