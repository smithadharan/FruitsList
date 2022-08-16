//
//  AnalyticsTrackerTests.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import Foundation
import XCTest
import RxSwift

@testable import FruitsList

class AnalyticsTrackerTests: XCTestCase {

    private let mocker: AnalyticsHttpMocker = AnalyticsHttpMocker()
    private let tracker: AnalyticsDataTracker = AnalyticsDataTracker(with: NewComponentCreater())
    private let disposeBag: DisposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        mocker.setUpStubs()
    }

    override func tearDown() {
        mocker.removeStubs()
        super.tearDown()
    }

    func testLogLoadEvent_whenSuccess_returnsHttpStatusOk() {
        FruitHttpMocker.scenario = FruitHttpMocker.Scenario.success
        var statusCode: StatusCode?

        let expectation = self.expectation(description: "")
        tracker.logLoadEvent(startDate: Date())
            .subscribe(onNext: { httpStatusCode in
                statusCode = httpStatusCode
                expectation.fulfill()
            }, onError: { error in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(statusCode, StatusCode.ok)
    }

    func testLogErrorEvent_whenSuccess_returnsHttpStatusOk() {
        FruitHttpMocker.scenario = FruitHttpMocker.Scenario.success
        var statusCode: StatusCode?

        let expectation = self.expectation(description: "")
        tracker.logErrorEvent(with: FruitsDataRequest(), error: ApiError.client)
            .subscribe(onNext: { httpStatusCode in
                statusCode = httpStatusCode
                expectation.fulfill()
            }, onError: { error in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(statusCode, StatusCode.ok)
    }

    func testLogDisplayEvent_whenSuccess_returnsHttpStatusOk() {
        FruitHttpMocker.scenario = FruitHttpMocker.Scenario.success
        var statusCode: StatusCode?

        let expectation = self.expectation(description: "")
        tracker.logDisplayEvent(startDate: Date())
            .subscribe(onNext: { httpStatusCode in
                statusCode = httpStatusCode
                expectation.fulfill()
            }, onError: { error in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(statusCode, StatusCode.ok)
    }

    func testLogDisplayEvent_whenFails_returnsHttpStatusOk() {
        FruitHttpMocker.scenario = FruitHttpMocker.Scenario.fail
        var statusCode: StatusCode?

        let expectation = self.expectation(description: "")
        tracker.logDisplayEvent(startDate: Date())
            .subscribe(onNext: { httpStatusCode in
                statusCode = httpStatusCode
                expectation.fulfill()
            }, onError: { error in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(statusCode, StatusCode.notFound)
    }

}
