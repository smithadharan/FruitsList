//
//  NutrionInfoProtocol.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import Foundation


protocol NutrionInfoProtocol {
    
    func nutritionInfo(type: FruitType) -> String?
}

extension NutrionInfoProtocol {
    
    func nutritionInfo(type: FruitType) -> String? {
        
        switch type {
        case .apple:  return Constants.appleNutritionInfo
        case .orange: return Constants.orangeNutritionInfo
        case .banana: return Constants.bananaNutrionInfo
        case .blueberry: return Constants.bluberyNutrionInfo
        case .pear: return Constants.pearNutrionInfo
        case .strawberry: return Constants.strawberryNutrionInfo
        case .pitaya: return Constants.pitayaNutrionInfo
        case .kumquat: return Constants.kumquatNutrionInfo
        case .kiwi: return Constants.kiwiNutrionInfo
        case .unknown: return "No Nutrition value found"
        }
    }
    
}

enum FruitType : String {
    case apple
    case orange
    case banana
    case blueberry
    case pear
    case strawberry
    case kumquat
    case pitaya
    case kiwi
    case unknown
    
}
