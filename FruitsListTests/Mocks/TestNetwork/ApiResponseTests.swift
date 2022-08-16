//
//  ApiResponseTests.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import XCTest

@testable import FruitsList

class ApiResponseTests: XCTestCase {

    func testApiFailError_whenHasStatusCode400_returnsApiErrorClient() {
        let response: ApiResponse = ApiResponse(
            resourceType: FruitsDataSource.self,
            httpResponse: HttpResponseDataTest.emptyHttpResponse(withStatusCode: 400),
            successHttpStatusCode: StatusCode.ok)

        XCTAssertEqual(response.apiFailError(), ApiError.client)
    }

    func testApiFailError_whenHasStatusCode500_returnsApiErrorServer() {
        let response: ApiResponse = ApiResponse(
            resourceType: FruitsDataSource.self,
            httpResponse: HttpResponseDataTest.emptyHttpResponse(withStatusCode: 500),
            successHttpStatusCode: StatusCode.ok)

        XCTAssertEqual(response.apiFailError(), ApiError.server)
    }

    func testApiFailError_whenHasInvalidStatusCode_returnsApiErrorUnknown() {
        let response: ApiResponse = ApiResponse(
            resourceType: FruitsDataSource.self,
            httpResponse: HttpResponseDataTest.emptyHttpResponse(withStatusCode: -100),
            successHttpStatusCode: StatusCode.ok)

        XCTAssertEqual(response.apiFailError(), ApiError.unknown)
    }

}
