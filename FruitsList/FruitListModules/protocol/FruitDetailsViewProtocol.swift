//
//  FruitDetailsViewProtocol.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

protocol FruitDetailsViewProtocol {

     func fruitName() -> String

     func priceInPoundsAndPencesFormatted() -> String

     func weightInKilogramsFormatted() -> String
    
    func nutritionInfo(type: FruitType) -> String?
    
}
