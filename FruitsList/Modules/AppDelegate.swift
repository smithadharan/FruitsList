//
//  AppDelegate.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let fruitsList: FruitsList = FruitsList(with: NewComponentCreater())
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        if isProductionEnabled() {
            _ = fruitsList.setUp(with: window!)
        }
        return true
    }

    private func isProductionEnabled() -> Bool {
        return !ProcessInfo.processInfo.arguments.contains("TEST_MODE")
    }

}
