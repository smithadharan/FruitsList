//
//  MockAnalyticsTracker.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import Foundation
import RxSwift

@testable import FruitsList

class MockAnalyticsTracker: AnalyticsDataTracker {

    override func logLoadEvent(startDate start: Date, currentDate: Date) -> Observable<StatusCode> {
        return Observable.just(StatusCode.ok)
    }

    override func logErrorEvent(with request: ApiEventRequest, error: ApiError) -> Observable<StatusCode> {
        return Observable.just(StatusCode.ok)
    }

    override func logDisplayEvent(startDate start: Date, currentDate: Date) -> Observable<StatusCode> {
        return Observable.just(StatusCode.ok)
    }

}
