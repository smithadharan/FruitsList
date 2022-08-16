

//
//  FruitRemoteRequestData.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import RxSwift

class FruitRemoteRequestData {

    private let apiClient: ApiClient

    required init(with createNewComponent: CreateNewComponent) {
        apiClient = createNewComponent.create(with: createNewComponent)
    }

    func findAllFruits(with request: FruitsDataRequest) -> Observable<[FruitDataModel]> {
        return apiClient.request(with: request)
            .map { ($0.resource as! FruitsDataSource).fruits }
    }

}
