
//
//  MockFruitsRequest.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//


@testable import FruitsList

class MockFruitsRequest: FruitsDataRequest {

    private var url: String
    private var method: HttpMethod

    init(url: String, method: HttpMethod) {
        self.url = url
        self.method = method
    }

    override func httpRequestUrl() -> String {
        return url
    }

    override func httpMethod() -> HttpMethod {
        return method
    }

}
