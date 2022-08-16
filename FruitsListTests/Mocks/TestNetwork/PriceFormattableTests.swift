//
//  PriceFormattableTests.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import XCTest

@testable import FruitsList

class PriceFormattableTests: XCTestCase {

    func testPriceInPoundsAndPencesFormatted_whenValueZero_returnsFormatted() {
        let formattable = MockPriceFormattable()
        formattable.mockValue = 0
        XCTAssertEqual(formattable.priceInPoundsAndPencesFormatted(), "£0.0")
    }

    func testPriceInPoundsAndPencesFormatted_whenValue511_returnsFormatted() {
        let formattable = MockPriceFormattable()
        formattable.mockValue = 511
        XCTAssertEqual(formattable.priceInPoundsAndPencesFormatted(), "£5.11")
    }

}
