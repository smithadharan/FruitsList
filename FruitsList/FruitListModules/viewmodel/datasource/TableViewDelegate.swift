
//
//  TableViewDelegate.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import UIKit
import RxSwift

class TableViewDelegate: NSObject, UITableViewDelegate {

    private let didSelectRowAt: PublishSubject<IndexPath> = PublishSubject<IndexPath>()

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAt.onNext(indexPath)
    }
    

    func didSelectRow() -> Observable<IndexPath> {
        return didSelectRowAt.asObservable()
    }

}
