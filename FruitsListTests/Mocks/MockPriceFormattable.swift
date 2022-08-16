//
//  MockPriceFormattable.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//


@testable import FruitsList

class MockPriceFormattable: PriceFormatterProtocol {

    var mockValue: Int!

    func priceInPences() -> Int {
        return mockValue
    }

}
