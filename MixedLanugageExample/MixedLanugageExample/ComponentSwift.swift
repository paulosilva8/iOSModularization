//
//  ComponentSwift.swift
//  MixedLanugageExample
//
//  Created by Gergely Orosz on 18/07/2015.
//  Copyright © 2015 GergelyOrosz. All rights reserved.
//

import UIKit
import CoreFramework

public class ComponentSwift: NSObject {

    @objc func sayHello(_ name: String) -> String {
        let nameForGreeting = name.count == 0 ? "World" : name
        let greeting = "Hello " + nameForGreeting + "!"
        return greeting
    }
    
    func callCoreDummy() {
        _ = CoreDummy()
    }
    
}
