//
//  File.swift
//  
//
//  Created by Paulo Silva on 19/09/2022.
//

import Foundation

internal final class ClassExternal: ClassExternalProtocol {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    public func printName() {
        print(name)
    }
    
}
