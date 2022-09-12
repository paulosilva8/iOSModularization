//
//  CoreFrameworkTests.swift
//  CoreFrameworkTests
//
//  Created by Paulo Silva on 31/08/2022.
//

import XCTest
import CoreFramework

class CoreFrameworkTests: XCTestCase {
    
    override func setUp() {
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_NotNil() {
        // given
        let component = CoreDummy()
        
        // then
        XCTAssertNotNil(component)
    }
    
}
