
//
//  DetailedViewModel.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import RxSwift

class DetailedViewModel: ViewModel, AnalyticsDataTrackable {

    private(set) var fruitListService: FruitListServices
    private let fruit: FruitDetailsViewProtocol
    private var analyticsTracker: AnalyticsDataTracker
    private let disposeBag: DisposeBag = DisposeBag()
    var displayEventStartDate: Date?

    required init(createNewComponent: CreateNewComponent, fruit: FruitDetailsViewProtocol) {
        fruitListService = createNewComponent.create(with: createNewComponent)
        analyticsTracker = createNewComponent.create(with: createNewComponent)
        self.fruit = fruit
    }

    func fruitDetail() -> Observable<FruitDetailsViewProtocol> {
        return Observable<FruitDetailsViewProtocol>.just(fruit)
    }

    func tracker() -> AnalyticsDataTracker {
        return analyticsTracker
    }

    func rxDisposeBag() -> DisposeBag {
        return disposeBag
    }

}
