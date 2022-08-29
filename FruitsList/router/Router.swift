
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
    
    /// set Root ViewController while loading the app
    /// - Parameters:
    ///   - window: window
    ///   - createNewComponent: viewController created for  based on the selection
    /// - Returns: window
    func setRootViewController(to window: UIWindow, createNewComponent: CreateNewComponent) -> UIWindow {
        let viewController = fruitsListRouter.fruitsViewController(with: createNewComponent)
        window.rootViewController = rootNavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
        return window
    }
    
    /// set up the root navigation viewcontroller
    /// - Parameter rootViewController: rootViewController
    /// - Returns: controller
    private func rootNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.gray]
        controller.navigationBar.tintColor = UIColor.gray
        return controller
    }

}
