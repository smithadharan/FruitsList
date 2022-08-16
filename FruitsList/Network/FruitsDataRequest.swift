
//
//  FruitsDataRequest.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

class FruitsDataRequest: ApiEventRequest {

    func httpRequestUrl() -> String {
        return "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json"
    }

    func httpMethod() -> HttpMethod {
        return HttpMethod.get
    }

    func response(from newResponse: HttpResponse) -> ApiResponse {
        return ApiResponse(
            resourceType: FruitsDataSource.self,
            httpResponse: newResponse,
            successHttpStatusCode: StatusCode.ok)
    }

}
