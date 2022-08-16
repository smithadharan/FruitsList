
//
//  TableViewCellProtocol.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

protocol TableViewCellProtocol {

    static var identifier: String { get }

    func configureCell(with tableViewItem: TableViewItem)

}
