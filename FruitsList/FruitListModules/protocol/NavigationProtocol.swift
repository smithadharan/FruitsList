//
//  NavigationProtocol.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import UIKit

protocol NavigationProtocol {

    func navigationController() -> UINavigationController?

}

extension NavigationProtocol {

    func navigationController() -> UINavigationController? {
        for window in UIApplication.shared.windows {
            if let rootViewController: UINavigationController = window.rootViewController as? UINavigationController {
                return rootViewController
            }
        }
        return nil
    }

}
