//
//  AnalyticsDataTrackable.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import Foundation
import RxSwift

protocol AnalyticsDataTrackable {

    func tracker() -> AnalyticsDataTracker

    func rxDisposeBag() -> DisposeBag

    var displayEventStartDate: Date? { get set }
}

extension AnalyticsDataTrackable {

    mutating func setDisplayStartDateNow() {
        displayEventStartDate = Date()
    }

    mutating func logDisplayEvent() {
        if displayEventStartDate == nil {
            return
        }
        tracker().logDisplayEvent(startDate: displayEventStartDate!)
            .subscribe()
            .disposed(by: rxDisposeBag())
        resetDisplayEventStartDate()
    }

    private mutating func resetDisplayEventStartDate() {
        displayEventStartDate = nil
    }

}
