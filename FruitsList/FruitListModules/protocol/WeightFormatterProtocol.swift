
//
//  WeightFormatterProtocol.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

protocol WeightFormatterProtocol {

    func weightInGrams() -> Int

    func weightInKilogramsFormatted() -> String
    
}

extension WeightFormatterProtocol {

    func weightInKilogramsFormatted() -> String {
        return "\(Double(weightInGrams()) / 1000.0) kg"
    }

}
