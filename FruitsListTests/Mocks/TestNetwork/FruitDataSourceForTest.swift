//
//  FruitDataSourceForTest.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import Foundation

@testable import FruitsList

class FruitDataSourceForTest {

    class func fruits() -> FruitsDataSource {
        return try! JSONDecoder().decode(FruitsDataSource.self, from: fruitsJsonData())
    }

    private class func fruitsJsonData() -> Data {
        return FileHelper().createData(fromFilename: "fruits", ofType: "json")!
    }

    class func emptyFruitsJsonData() -> Data {
        return  "{\"fruit\": []}".data(using: .utf8)!
    }

    class func emptyFruitJson() -> Data {
        return "{}".data(using: .utf8)!
    }

    class func appleJsonData() -> Data {
        return  "{\"type\":\"apple\", \"price\":149, \"weight\":120}".data(using: .utf8)!
    }

}
