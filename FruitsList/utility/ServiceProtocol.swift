//
//  ServiceProtocol.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//


protocol ServiceProtocol {

    func create(with createNewComponent: CreateNewComponent) -> FruitListServices

}

extension ServiceProtocol {

    func create(with createNewComponent: CreateNewComponent) -> FruitListServices {
        return FruitListServices(with: createNewComponent)
    }

}
