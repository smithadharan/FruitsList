
//
//  PriceFormattableTests.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import Foundation

@testable import FruitsList

class HttpResponseDataTest {

    class func httpResponse(withStatusCode statusCode: Int) -> HttpResponse {
        let response: HTTPURLResponse? = HTTPURLResponse(
            url: URL(string: "http://apple.com")!,
            statusCode: statusCode,
            httpVersion: "1.0",
            headerFields: nil)
        let value: Data = "{ }".data(using: String.Encoding.utf8)!
        return HttpResponse(response: response, data: value, error: nil)
    }

    class func emptyHttpResponse(withStatusCode statusCode: Int) -> HttpResponse {
        let response: HTTPURLResponse? = HTTPURLResponse(
            url: URL(string: "http://apple.com")!,
            statusCode: statusCode,
            httpVersion: "1.0",
            headerFields: nil)
        let value: Data = "".data(using: String.Encoding.utf8)!
        return HttpResponse(response: response, data: value, error: NSError(domain: "network error", code: -1, userInfo: nil))
    }

}
