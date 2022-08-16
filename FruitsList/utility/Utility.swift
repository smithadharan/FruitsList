//
//  UtilityCreatable.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//


protocol Utility {

    func create(with createNewComponent: CreateNewComponent) -> ApiClient

    func create() -> HttpClient

    func create(with createNewComponent: CreateNewComponent) -> AnalyticsDataTracker

}

extension Utility {

    func create(with createNewComponent: CreateNewComponent) -> ApiClient {
        return ApiClient(with: createNewComponent)
    }

    func create() -> HttpClient {
        return HttpClient()
    }

    func create(with createNewComponent: CreateNewComponent) -> AnalyticsDataTracker {
        return AnalyticsDataTracker(with: createNewComponent)
    }

}
