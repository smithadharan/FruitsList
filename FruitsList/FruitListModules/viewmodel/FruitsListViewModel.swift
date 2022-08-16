
//
//  FruitsListViewModel.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import RxSwift

class FruitsListViewModel: ViewModel, AnalyticsDataTrackable {

    private let disposeBag: DisposeBag = DisposeBag()
    private(set) var reloadData: PublishSubject<Void> = PublishSubject<Void>()
    private(set) var dataSource = TableViewDataSource<FruitDataModel, FruitTableViewCell>()
    private(set) var delegate: TableViewDelegate = TableViewDelegate()
    private(set) var fruitListServices: FruitListServices
    private(set) var fruitDetailRouter: DetailViewRouter
    private var createNewComponent: CreateNewComponent
    private var analyticsTracker: AnalyticsDataTracker
    var displayEventStartDate: Date?

    required init(with createNewComponent: CreateNewComponent) {
        self.createNewComponent = createNewComponent
        fruitListServices = createNewComponent.create(with: createNewComponent)
        fruitDetailRouter = createNewComponent.create()
        analyticsTracker = createNewComponent.create(with: createNewComponent)
        subscribe()
    }

    func subscribe() {
        delegate.didSelectRow()
            .map { self.findFruit(at: $0) }
            .subscribe(onNext: { [weak self] fruit in
                guard let `self` = self else { return }
                self.fruitDetailRouter.showFruitDetail(createNewComponent: self.createNewComponent, fruit: fruit)
            }).disposed(by: disposeBag)
    }

    func loadFruits() -> Observable<Void> {
        return fruitListServices.findAllFruits(with: FruitsDataRequest())
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] newFruits in
                self?.dataSource.appendOnce(contentsOf: newFruits)
                }, onError: { [weak self] error in
                    self?.onLoadFruitsCompletedWithError()
                }, onCompleted: {  [weak self] in
                    self?.onLoadFruitsCompleted()
                }, onSubscribe: { [weak self] in
                    self?.onLoadFruitsStarted()
            }).map { _ in return () }
    }
    
    func tracker() -> AnalyticsDataTracker {
        return analyticsTracker
    }

    func rxDisposeBag() -> DisposeBag {
        return disposeBag
    }

    private func findFruit(at indexPath: IndexPath) -> FruitDataModel {
        return dataSource.findItem(at: indexPath) as! FruitDataModel
    }

    private func onLoadFruitsStarted() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    private func onLoadFruitsCompleted() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        reloadData.onNext(())
    }

    private func onLoadFruitsCompletedWithError() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}
