//
//  MockWeightFormattable.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//


@testable import FruitsList

class MockWeightFormattable: WeightFormatterProtocol {

    var mockValue: Int!

    func weightInGrams() -> Int {
        return mockValue
    }

}
