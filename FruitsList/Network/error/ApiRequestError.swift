
//
//  ApiRequestError.swift
//  FruitsList
//
//  Created by smitha Dharan on 16/08/2022.
//

enum ApiRequestError: Error, Equatable {

    case invalidUrl(String)


    static func == (lhs: ApiRequestError, rhs: ApiRequestError) -> Bool {
        switch (lhs, rhs) {
        case (let .invalidUrl(leftMessage), let .invalidUrl(rightMessage)):
            return leftMessage == rightMessage
        }
    }

}
