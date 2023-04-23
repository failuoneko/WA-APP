//
//  AirportListViewModel.swift
//  WA-APP
//
//  Created by L on 2023/4/23.
//

import Foundation

class AirportListViewModel: ObservableObject {
    
    var response: AirportsResponse?
    
    init() {
        let response: AirportsResponse = Bundle.main.decode("airports")
        self.response = response
    }
}
