//
//  AnalyticsRequestTests.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import XCTest
import RxSwift

@testable import FruitsList

class AnalyticsRequestTests: XCTestCase {

    private let disposeBag: DisposeBag = DisposeBag()

    func testAsUrlRequest_whenHasValidDetail_returnsUrlRequest() {
        let detail = AnalyticsDetailesEventInfo(description: "request failed with 401")
        let request = AnalyticsRequestCallable(event: AnalyticsEventsTracker.error(detail))
        let expectedUrl: String = "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats?"
            + "event=error&data=request%20failed%20with%20401"
  
        XCTAssertEqual(request.asUrlRequest().url?.absoluteString, expectedUrl)
        XCTAssertEqual(request.asUrlRequest().httpMethod, "GET")
        XCTAssertEqual(request.asUrlRequest().cachePolicy, URLRequest.CachePolicy.reloadIgnoringLocalCacheData)
        XCTAssertEqual(request.asUrlRequest().timeoutInterval, 33.0)
    }

}
