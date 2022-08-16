//
//  AnalyticsDetailesEventInfo.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

import Foundation

struct AnalyticsDetailesEventInfo {

    private(set) var description: String

    func urlQueryAllowed() -> String {
        return  description.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }

}
