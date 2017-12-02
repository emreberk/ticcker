//
//  ticckerTests.swift
//  ticckerTests
//
//  Created by Emre Berk on 17/11/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import XCTest
@testable import ticcker

class ticckerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let string = C.API.URLString
        XCTAssertEqual(string, "https://api.coinmarketcap.com/v1/ticker/?limit=10")
    }
    
}
