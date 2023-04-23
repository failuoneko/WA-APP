//
//  ProductItemResponse.swift
//  WA-APP
//
//  Created by L on 2023/4/23.
//

import Foundation

struct ProductItemResponse: Codable {
    
    var price: Int
    var name: String
    var description: String
    var netContent: String
    var ingredient: String
    var images: [String]

    enum CodingKeys: String, CodingKey {
        case price = "price"
        case name = "name"
        case description = "description"
        case netContent = "netContent"
        case ingredient = "ingredient"
        case images = "images"
    }
}
