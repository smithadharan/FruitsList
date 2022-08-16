

//
//  ApiResponse.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import Foundation

struct ApiResponse {

    private(set) var resource: Resource?
    private(set) var httpStatusCode: StatusCode!
    private var successHttpStatusCode: StatusCode!

    init<RESOURCE: Resource>(
        resourceType: RESOURCE.Type,
        httpResponse: HttpResponse,
        successHttpStatusCode: StatusCode) {
        self.resource = createResource(resourceType: resourceType, data: httpResponse.data)
        self.httpStatusCode = httpResponse.statusCode()
        self.successHttpStatusCode = successHttpStatusCode
    }

    private func createResource<RESOURCE: Resource>(resourceType: RESOURCE.Type, data: Data?) -> Resource? {
        if hasData(withData: data) {
            do {
                return try JSONDecoder().decode(RESOURCE.self, from: data!)
            } catch let error {
                print("decoding failed with error", error)
            }
        }
        return nil
    }

    private func hasData(withData data: Data?) -> Bool {
        if let data: Data = data, data.count > 0 {
            return true
        }
        return false
    }

    func isSuccess() -> Bool {
        return successHttpStatusCode == httpStatusCode
    }

    func apiFailError() -> ApiError {
        if hasClientError() {
            return ApiError.client
        } else if hasServerError() {
            return ApiError.server
        }
        return ApiError.unknown
    }

    private func hasClientError() -> Bool {
        return StatusCode.clientErrorsGroup.contains(httpStatusCode.rawValue)
    }

    private func hasServerError() -> Bool {
        return StatusCode.serverErrorsGroup.contains(httpStatusCode.rawValue)
    }

}
