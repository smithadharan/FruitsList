
//
//  Reactive.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//


import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIActivityIndicatorView {

    var isLoading: AnyObserver<Bool> {
        return Binder(self.base) { view, isLoading in
            if isLoading {
                view.startAnimating()
            } else {
                view.stopAnimating()
            }
            }.asObserver()
    }

}
