//
//  DetailedViewController.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import UIKit
import RxSwift

class DetailedViewController: UIViewController, ChangeControllerProtocol {

    private let disposeBag: DisposeBag = DisposeBag()
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    @IBOutlet weak var weightInKilo: UILabel!
    @IBOutlet weak var princeInPound: UILabel!
    @IBOutlet weak var NutritionInfo: UILabel!
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var fImage: UIImageView!
    private(set) lazy var fruitDetailViewModel: DetailedViewModel = {
        return self.viewModel as! DetailedViewModel
    }()
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitDetailViewModel.setDisplayStartDateNow()
        subscribe()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fruitDetailViewModel.logDisplayEvent()
    }
    
    /// subscribe the events to setup the UI with the fruit data
    private func subscribe() {
        fruitDetailViewModel.fruitDetail()
            .subscribe(onNext: { [weak self] fruit in
                self?.setUp(detail: fruit)
            }).disposed(by: disposeBag)
    }

    /// setUp  the UI Detailed page 
    func setUp(detail: FruitDetailsViewProtocol) {
        priceLabel.text = detail.priceInPoundsAndPencesFormatted()
        weightLabel.text = detail.weightInKilogramsFormatted()
        fruitName.text = detail.fruitName().capitalized
        fImage.image = UIImage.init(named: fruitName.text!)
        let name = detail.fruitName()
        NutritionInfo.text = detail.nutritionInfo(type: FruitType(rawValue: name)!)

        navigationItem.title = detail.fruitName().capitalized
    }

}
