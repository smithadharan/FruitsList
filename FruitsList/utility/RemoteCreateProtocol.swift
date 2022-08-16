

//
//  RemoteCreateProtocol.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

protocol RemoteCreateProtocol {

    func create(with createNewComponent: CreateNewComponent) -> FruitRemoteRequestData

}

extension RemoteCreateProtocol {

    func create(with createNewComponent: CreateNewComponent) -> FruitRemoteRequestData {
        return FruitRemoteRequestData(with: createNewComponent)
    }

}
