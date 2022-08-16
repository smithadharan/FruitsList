//
//  ApiClient.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//


import Foundation
import RxSwift

class ApiClient {

    private let httpClient: HttpClient
    private let tracker: AnalyticsDataTracker
    private let disposeBag: DisposeBag = DisposeBag()
    private var requestStartDate: Date!

    required init(with createNewComponent: CreateNewComponent) {
        httpClient = createNewComponent.create()
        tracker = createNewComponent.create(with: createNewComponent)
    }

    func request(with request: ApiEventRequest) -> Observable<ApiResponse> {
        self.requestStartDate = Date()
        return httpClient.request(urlRequest: try! request.asURLRequest())
            .flatMap { newResponse in
                return request.response(from: newResponse)
                    .do(onNext: { [weak self]  _ in
                        guard let `self` = self, let date = self.requestStartDate else { return }
                        self.logEventOnNext(startDate: date)
                        }, onError: { [weak self] error in
                            self?.logEventOnError(with: request, error: error as! ApiError)
                        })
        }
    }

    private func logEventOnNext(startDate: Date) {
        tracker.logLoadEvent(startDate: startDate)
            .subscribe()
            .disposed(by: disposeBag)
    }
    
    private func logEventOnError(with request: ApiEventRequest, error: ApiError) {
        tracker.logErrorEvent(with: request, error: error)
            .subscribe()
            .disposed(by: disposeBag)
    }

}
