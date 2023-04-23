//
//  AirportsResponse.swift
//  WA-APP
//
//  Created by L on 2023/4/23.
//

import Foundation

struct AirportsResponse: Codable {
    
    var airports: [Airport]

    enum CodingKeys: String, CodingKey {
        case airports = "airports"
    }

    struct Airport: Codable, Identifiable {
        let id = UUID()
        var code: String
        var name: String

        enum CodingKeys: String, CodingKey {
            case code = "code"
            case name = "name"
        }
    }
}
