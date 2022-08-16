//
//  FruitsViewController.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//
import UIKit
import RxSwift

class FruitsViewController: UIViewController, ChangeControllerProtocol {

    private let disposeBag: DisposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!
    private(set) lazy var fruitsListViewModel: FruitsListViewModel = {
        return self.viewModel as! FruitsListViewModel
    }()
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitsListViewModel.setDisplayStartDateNow()
        setUp()
        subscribe()
        fruitsListViewModel.loadFruits()
            .subscribe()
            .disposed(by: disposeBag)
    }

    private func setUp() {
        setUpTableView()
        setUpNavigationBarTitle()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fruitsListViewModel.logDisplayEvent()
    }

    func subscribe() {
        fruitsListViewModel.reloadData
            .asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            }).disposed(by: disposeBag)
    }

    private func setUpTableView() {
        tableView.dataSource = fruitsListViewModel.dataSource
        tableView.delegate = fruitsListViewModel.delegate

    }

    private func setUpNavigationBarTitle() {
        navigationItem.title = "Fruits List"
    }

}
