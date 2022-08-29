//
//  FruitsList.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import UIKit

class FruitsList {

    private let router: Router
    private let createNewComponent: CreateNewComponent

    //Router created
    required init(with createNewComponent: CreateNewComponent) {
        self.createNewComponent = createNewComponent
        router = createNewComponent.create(with: createNewComponent)
    }

    //setting up the rootviewcontroller
    func setUp(with window: UIWindow) -> UIWindow {
        return router.setRootViewController(to: window, createNewComponent: createNewComponent)
    }

}
