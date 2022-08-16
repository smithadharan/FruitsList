//
//  AnalyticsEventTests.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import XCTest
import RxSwift

@testable import FruitsList

class AnalyticsEventTests: XCTestCase {

    func testDetail_WhenCreatedWithTypeError_returnsEventErrorUrlAsQueryParameters() {
        let event = AnalyticsEventsTracker.error(AnalyticsDetailesEventInfo(description: "failed api"))
        XCTAssertEqual(event.detail(), "event=error&data=failed%20api")
    }

    func testDetail_WhenCreatedWithTypeDisplay_returnsEventDisplayAsUrlAsQueryParameters() {
        let event = AnalyticsEventsTracker.display(AnalyticsDetailesEventInfo(description: "2000"))
        XCTAssertEqual(event.detail(), "event=display&data=2000")
    }

    func testDetail_WhenCreatedWithTypeLoad_returnsEventLoadAsUrlAsQueryParameters() {
        let event = AnalyticsEventsTracker.load(AnalyticsDetailesEventInfo(description: "1000"))
        XCTAssertEqual(event.detail(), "event=load&data=1000")
    }

}
