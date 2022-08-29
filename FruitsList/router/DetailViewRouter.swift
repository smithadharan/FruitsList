
//
//  DetailViewRouter.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import UIKit

class DetailViewRouter: ViewControllerCreateProtocol, NavigationProtocol {
    
    /// Shows the fruit details
    /// - Parameters:
    ///   - createNewComponent: CreateNewComponent
    ///   - fruit: FruitDetailsViewProtocol
    ///   - animated: animated
    func showFruitDetail(
        createNewComponent: CreateNewComponent,
        fruit: FruitDetailsViewProtocol,
        animated: Bool = true) {
        let viewController: DetailedViewController = createViewController(
            with: DetailedViewModel(createNewComponent: createNewComponent, fruit: fruit),
            viewControllerType: DetailedViewController.self) as! DetailedViewController

        navigationController()?.pushViewController(viewController, animated: animated)
    }

}
