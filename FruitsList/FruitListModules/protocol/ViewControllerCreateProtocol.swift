
//
//  ViewControllerCreateProtocol.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import UIKit

protocol ViewControllerCreateProtocol {

    func createViewController<VC: UIViewController> (
        with viewModel: ViewModel,
        viewControllerType: VC.Type) -> UIViewController

    func createViewController<VC: UIViewController>(with type: VC.Type) -> UIViewController

}

extension ViewControllerCreateProtocol {

    func createViewController<VC: UIViewController>(
        with viewModel: ViewModel,
        viewControllerType: VC.Type) -> UIViewController {
        var modelableViewController: ChangeControllerProtocol = createViewController(
            with: viewControllerType) as! ChangeControllerProtocol
        modelableViewController.viewModel = viewModel
        return modelableViewController as! VC
    }

    func createViewController<VC: UIViewController>(with type: VC.Type) -> UIViewController {
        let storyboardName: String = String(describing: type)
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController: VC = storyboard.instantiateViewController(withIdentifier: storyboardName) as! VC
        return viewController
    }

}
