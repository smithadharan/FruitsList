//
//  FileHelper.swift
//  FruitsList
//
//  Created by smitha Dharan on 15/08/2022.
//

import Foundation

@testable import FruitsList

class FileHelper {

    func createData(fromFilename filename: String, ofType: String) -> Data? {
        do {
            let bundle: Bundle = Bundle(for: type(of: self))
            if let url: URL = bundle.url(forResource: filename, withExtension: ofType) {
                return try Data(contentsOf: url, options: NSData.ReadingOptions.init(rawValue: 0))
            }
        } catch {
        }
        return nil
    }

}
