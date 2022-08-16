
//
//  FruitsDataSource.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

struct FruitsDataSource: Resource {

    private(set) var fruits: [FruitDataModel] = [FruitDataModel]()

    init(from decoder: Decoder) throws {
        let value: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        fruits = try value.decode([FruitDataModel].self, forKey: .fruit)
    }

    private enum CodingKeys: String, CodingKey {
        case fruit = "fruit"
    }

}
