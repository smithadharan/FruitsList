
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

    /// Initialise our component
    /// - Parameters:
    ///   - createNewComponent: createNewComponent
    ///   - fruit: fruit
    required init(createNewComponent: CreateNewComponent, fruit: FruitDetailsViewProtocol) {
        fruitListService = createNewComponent.create(with: createNewComponent)
        analyticsTracker = createNewComponent.create(with: createNewComponent)
        self.fruit = fruit
    }
    
    /// fruitDetail method observable observes the fruits data from the FruitDetailsViewProtocol
    /// - Returns: FruitDetailsViewProtocol
    func fruitDetail() -> Observable<FruitDetailsViewProtocol> {
        return Observable<FruitDetailsViewProtocol>.just(fruit)
    }

    func tracker() -> AnalyticsDataTracker {
        return analyticsTracker
    }
    
    /// DisposableBag method is responsible to remove all containers which is not used by the subscriber
    /// - Returns: DisposeBag
    func rxDisposeBag() -> DisposeBag {
        return disposeBag
    }

}
