//
//  AirportListView.swift
//  WA-APP
//
//  Created by L on 2023/4/23.
//

import SwiftUI

struct AirportListView: View {
    
    let viewModel = AirportListViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List(viewModel.response?.airports ?? []) { airport in
            NavigationLink(destination: Text(airport.name)) {
                Text(airport.name)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("SIM卡的領取方法")
    }
}

struct AirportsView_Previews: PreviewProvider {
    static var previews: some View {
        AirportListView()
    }
}
