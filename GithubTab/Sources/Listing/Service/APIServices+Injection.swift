//
//  APIServices+Injection.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 08/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import Resolver

extension Resolver {
    public static func registerAPIServices() {
        register { APIManager() }.scope(.application)
        register { ClassExternal(name: "NAME") as ClassExternalProtocol}
    }
}
