
//
//  HttpResponse.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import Foundation

struct HttpResponse {

    private(set) var response: HTTPURLResponse?
    private(set) var data: Data?
    private(set) var error: Error?

    func statusCode() -> StatusCode {
        return StatusCode.findOrReturnUndefined(statusCode: response?.statusCode)
    }

}
