//
//  AnalyticsDataTracker.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//


import Foundation
import RxSwift

class AnalyticsDataTracker {

    private var httpClient: HttpClient

    required init(with createNewComponent: CreateNewComponent) {
        httpClient = createNewComponent.create()
    }

    func logDisplayEvent(startDate start: Date, currentDate: Date = Date()) -> Observable<StatusCode> {
        let detail = AnalyticsDetailesEventInfo(description: elapsedTimeInMilliseconds(startDate: start, currentDate: currentDate))
        let event = AnalyticsEventsTracker.display(detail)
        return logEvent(with: event)
    }

    func logLoadEvent(startDate start: Date, currentDate: Date = Date()) -> Observable<StatusCode> {
        let detail = AnalyticsDetailesEventInfo(description: elapsedTimeInMilliseconds(startDate: start, currentDate: currentDate))
        let event = AnalyticsEventsTracker.load(detail)
        return logEvent(with: event)
    }

    private func elapsedTimeInMilliseconds(startDate start: Date, currentDate: Date) -> String {
        let elapsed: Double = currentDate.timeIntervalSince(start) * 1000
        return "\(elapsed)"
    }

    func logErrorEvent(with request: ApiEventRequest, error: ApiError) -> Observable<StatusCode> {
        let detail = AnalyticsDetailesEventInfo(description: "request to =\(request.httpRequestUrl())"
            + "failed with api error type\(error)")
        return logEvent(with: AnalyticsEventsTracker.error(detail))
    }

    private func logEvent(with event: AnalyticsEventsTracker) -> Observable<StatusCode> {
        let request: AnalyticsRequestCallable = AnalyticsRequestCallable(event: event)
        return httpClient.request(urlRequest: request.asUrlRequest())
            .map { response in
                return response.statusCode()
        }
    }

}
