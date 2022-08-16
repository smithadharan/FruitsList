//
//  AnalyticsEventsTracker.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

enum AnalyticsEventsTracker {

    case load(AnalyticsDetailesEventInfo)

    case display(AnalyticsDetailesEventInfo)

    case error(AnalyticsDetailesEventInfo)


    func detail() -> String {
        switch self {
        case let .load(detail):
            return "event=load&data=" + detail.urlQueryAllowed()
        case let .display(detail):
            return "event=display&data=" + detail.urlQueryAllowed()
        case let .error(detail):
            return "event=error&data=" + detail.urlQueryAllowed()
        }
    }

}
