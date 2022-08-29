
//
//  FruitsListRouter.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import UIKit

class FruitsListRouter: ViewControllerCreateProtocol, NavigationProtocol {
    
    /// fruits list viewcontroller shows all the fruit list
    /// - Parameter createNewComponent: createNewComponent
    /// - Returns: createViewController
    func fruitsViewController(with createNewComponent: CreateNewComponent) -> FruitsViewController {
        return createViewController(
            with: FruitsListViewModel(with: createNewComponent),
            viewControllerType: FruitsViewController.self) as! FruitsViewController
    }

}
