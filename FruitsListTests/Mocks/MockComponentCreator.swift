
//
//  MockComponentCreator.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

@testable import FruitsList

class MockComponentCreator: CreateNewComponent {

    var fruitListService: FruitListServices!
    var fruitDetailRouter: DetailViewRouter!
    var analyticsTracker: AnalyticsDataTracker!

    init() {
    }

    func mockFruitListService() -> MockFruitListService {
        return fruitListService as! MockFruitListService
    }

    func mockFruitDetailRouter() -> MockFruitDetailRouter {
        return fruitDetailRouter as! MockFruitDetailRouter
    }

    func mockAnalyticsTracker() -> MockAnalyticsTracker {
        return analyticsTracker as! MockAnalyticsTracker
    }

    func create(with createNewComponent: CreateNewComponent) -> FruitListServices {
        return fruitListService
    }

    func create() -> DetailViewRouter {
        return fruitDetailRouter
    }

    class func buildAllMocks() -> MockComponentCreator {
        let creator: MockComponentCreator = MockComponentCreator()
        creator.analyticsTracker = MockAnalyticsTracker(with: creator)
        creator.fruitListService = MockFruitListService(with: creator)
        creator.fruitDetailRouter = MockFruitDetailRouter()
        return creator
    }

}
