//
//  LabelSwift.swift
//  MixedLanugageExample
//
//  Created by Gergely Orosz on 18/07/2015.
//  Copyright © 2015 GergelyOrosz. All rights reserved.
//

import UIKit
import ObjectiveCComponent

public final class LabelSwift: UILabel {

    required public init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
        self.initText()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initText()
    }
    
    public func initText() {
        let componentObjectiveC = ComponentObjectiveC()
        self.text = componentObjectiveC.sayHello("Objective C")
    }
}
