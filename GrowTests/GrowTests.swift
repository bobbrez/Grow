//
//  GrowTests.swift
//  GrowTests
//
//  Created by Bob Breznak on 8/16/17.
//  Copyright © 2017 Bob Breznak. All rights reserved.
//

import XCTest
@testable import Grow

class GrowTests: XCTestCase {
    
    // MARK: Food Class Tests
    
    func testFoodInitializationSuccess() {
        let zeroRatingFood = Food.init(name: "Zero", image: nil, raiting: 0)
        XCTAssertNotNil(zeroRatingFood)
        
        let positiveRaitingFood = Food.init(name: "One", image: nil, raiting: 5)
        XCTAssertNotNil(positiveRaitingFood)
    }
    
    func testFoodInitializationFails() {
        let negativeRatingFood = Food.init(name: "Negative", image: nil, raiting: -1)
        XCTAssertNil(negativeRatingFood)
        
        let blankNameFood = Food.init(name: "", image: nil, raiting: 1)
        XCTAssertNil(blankNameFood)
    }
}
