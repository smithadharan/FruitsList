
//
//  MockFruitListService.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import RxSwift

@testable import FruitsList

class MockFruitListService: FruitListServices {

    var isFindAllFruitsSuccess = false

    override func findAllFruits(with request: FruitsDataRequest) -> Observable<[FruitDataModel]> {
        return isFindAllFruitsSuccess
            ? Observable.just(FruitDataSourceForTest.fruits().fruits)
            : Observable.error(ApiError.client)
    }

}
