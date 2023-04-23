//
//  ProductItemViewModel.swift
//  WA-APP
//
//  Created by L on 2023/4/23.
//

import Foundation

class ProductItemViewModel: ObservableObject {
    
    var response: ProductItemResponse?
    @Published var quantity = 1
    
    var firstImageUrl: URL? {
        if let urlString = response?.images.first {
            return URL(string: urlString)
        }
        return nil
    }
    
    init() {
        let response: ProductItemResponse = Bundle.main.decode("productItem")
        self.response = response
    }
    
    func increaseQuantity() {
        if quantity < 100 {
            quantity += 1
        }
    }
    
    func decreaseQuantity() {
        if quantity > 0 {
            quantity -= 1
        }
    }
}
