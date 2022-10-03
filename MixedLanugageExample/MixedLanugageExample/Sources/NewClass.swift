//
//  NewClass.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 30/09/2022.
//

import Foundation

class NewClass {
    let more = MoreVC()
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func callName() {
        print(name)
        let moreVC = more
        more.title = "More VC"
    }
}
