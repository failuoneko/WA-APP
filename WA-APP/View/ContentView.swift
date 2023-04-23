//
//  ContentView.swift
//  WA-APP
//
//  Created by L on 2023/4/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AirportListView()) {
                    Text("空港リスト")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .navigationBarTitle("")
                .padding()

                NavigationLink(destination: ProductItemView()) {
                    Text("商品詳細")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .navigationBarTitle("")
                .padding()
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
