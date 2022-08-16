//
//  FruitsViewControllerTests.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import XCTest
import RxSwift

@testable import FruitsList

class FruitsViewControllerTests: XCTestCase, ViewControllerCreateProtocol {

    let disposeBag: DisposeBag = DisposeBag()
    let creator: MockComponentCreator = MockComponentCreator.buildAllMocks()
    var viewController: FruitsViewController!

    func testViewDidLoad_whenViewControllerIsLoaded_loadsFruits() {
        creator.mockFruitListService().isFindAllFruitsSuccess = true
        viewController = fruitsViewController()

        let expectation = self.expectation(description: "")
        viewController.fruitsListViewModel
            .reloadData.subscribe(onNext: { _ in
                expectation.fulfill()
            }, onError: { _ in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        _ = viewController.view
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(viewController.tableView.numberOfRows(inSection: 0), 9)
    }

    func testViewDidLoad_whenViewControllerIsLoaded_setsUpTableViewDataSourceAndDelegate() {
        creator.mockFruitListService().isFindAllFruitsSuccess = true
        viewController = fruitsViewController()
        _ = viewController.view

        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertNotNil(viewController.tableView.delegate)
    }

    private func fruitsViewController() -> FruitsViewController {
        return createViewController(
            with: FruitsListViewModel(with: creator),
            viewControllerType: FruitsViewController.self)
            as! FruitsViewController
    }

}
