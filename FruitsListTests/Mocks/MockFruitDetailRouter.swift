//
//  MockFruitListService.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import UIKit

@testable import FruitsList

class MockFruitDetailRouter: DetailViewRouter {

    var isShowFruitDetailCalled = false

    override func showFruitDetail(createNewComponent: CreateNewComponent, fruit: FruitDetailsViewProtocol, animated: Bool) {
        isShowFruitDetailCalled = true
    }

}
