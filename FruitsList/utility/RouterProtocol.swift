//
//  RouterCreatable.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

protocol RouterProtocol {

    func create(with createNewComponent: CreateNewComponent) -> Router

    func create() -> FruitsListRouter

    func create() -> DetailViewRouter

}

extension RouterProtocol {

    func create(with createNewComponent: CreateNewComponent) -> Router {
        return Router(with: createNewComponent)
    }

    func create() -> FruitsListRouter {
        return FruitsListRouter()
    }

    func create() -> DetailViewRouter {
        return DetailViewRouter()
    }

}
