
//
//  Router.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import UIKit

class Router: ViewControllerCreateProtocol, NavigationProtocol {

    private let fruitsListRouter: FruitsListRouter

    required init(with createNewComponent: CreateNewComponent) {
        fruitsListRouter = createNewComponent.create()
    }

    func setRootViewController(to window: UIWindow, createNewComponent: CreateNewComponent) -> UIWindow {
        let viewController = fruitsListRouter.fruitsViewController(with: createNewComponent)
        window.rootViewController = rootNavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
        return window
    }

    private func rootNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.gray]
        controller.navigationBar.tintColor = UIColor.gray
        return controller
    }

}
