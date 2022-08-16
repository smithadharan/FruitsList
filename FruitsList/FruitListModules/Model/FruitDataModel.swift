
//
//  FruitDataModel.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

struct FruitDataModel: Resource, PriceFormatterProtocol, WeightFormatterProtocol,NutrionInfoProtocol, FruitDetailsViewProtocol, TableViewItem {
    
    

    private var type: String
    private var price: Int
    private var weight: Int
    

    init(from decoder: Decoder) throws {
        let value: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        type = try value.decode(String.self, forKey: .type)
        price = try value.decode(Int.self, forKey: .price)
        weight = try value.decode(Int.self, forKey: .weight)
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case price
        case weight
    }

    func fruitName() -> String {
        return type
    }

    func priceInPences() -> Int {
        return price
    }

    func weightInGrams()  -> Int {
        return weight
    }
    
    func NutritionInfo() -> String {
        return ""
    }
    

}
