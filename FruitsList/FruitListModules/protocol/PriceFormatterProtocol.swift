
//
//  PriceFormatterProtocol.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

protocol PriceFormatterProtocol {

    func priceInPences() -> Int

}

extension PriceFormatterProtocol {

    func priceInPoundsAndPencesFormatted() -> String {
        return "£\(Double(priceInPences()) / 100.0)"
    }

}
