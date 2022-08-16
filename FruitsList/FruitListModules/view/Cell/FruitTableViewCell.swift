//
//  FruitTableViewCell.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import UIKit

class FruitTableViewCell:  UITableViewCell, TableViewCellProtocol {
    
    @IBOutlet weak var fruitName: UILabel!
    static var identifier: String = "\(FruitTableViewCell.self)"
    @IBOutlet weak var fruitimg: UIImageView!
    
//    static func nib() -> UINib {
//        return UINib(nibName: "FruitTableViewCell", bundle: nil)
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configureCell(with tableViewItem: TableViewItem) {
        let fruit = tableViewItem as! FruitDataModel
        resetContent()
        fruitName.text = fruit.fruitName().capitalized       
    }

    private func resetContent() {
        fruitName.text = nil
    }

}
