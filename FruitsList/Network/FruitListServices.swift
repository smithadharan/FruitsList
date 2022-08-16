
//
//  FruitListServices.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import RxSwift

class FruitListServices: Service {

    private var fruitRemoteRequestData: FruitRemoteRequestData

    required init(with createNewComponent: CreateNewComponent) {
        fruitRemoteRequestData = createNewComponent.create(with: createNewComponent)
    }

    func findAllFruits(with request: FruitsDataRequest) -> Observable<[FruitDataModel]> {
        return fruitRemoteRequestData.findAllFruits(with: request)
    }

}
