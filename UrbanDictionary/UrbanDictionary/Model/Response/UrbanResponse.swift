//
//  UrbanResponse.swift
//  UrbanDictionary
//
//  Created by Saulo Garcia on 9/19/20.
//

import Foundation
import RxRetroSwift

struct ErrorModel:HasErrorInfo, Codable {
  var errorCode: Int?
  var errorDetail: String?
}

struct UrbanResponse:Codable {
    let list: [Word]
}

struct Word: Codable {
    let definition: String
    let thumbs_up: Int
    let thumbs_down: Int
}
