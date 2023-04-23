//
//  ProductItemView.swift
//  WA-APP
//
//  Created by L on 2023/4/23.
//

import SwiftUI
import Kingfisher

struct ProductItemView: View {
    
    @ObservedObject var viewModel = ProductItemViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                topFixedArea
                middleScrollView
                bottomActionArea
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    print("magnifyingglass")
                } label: {
                    Image(systemName: "magnifyingglass").foregroundColor(.black)
                }
                
                Button {
                    print("heart")
                } label: {
                    Image(systemName: "heart").foregroundColor(.black)
                }
                
                Button {
                    print("cart")
                } label: {
                    Image(systemName: "cart").foregroundColor(.black)
                }
            }
        }
    }
}

extension ProductItemView {
    
    private var topFixedArea: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse").foregroundColor(.red)
            Text("JR成田機場站")
            Image(systemName: "chevron.down")
        }
        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        .frame(width: UIScreen.main.bounds.width, alignment: .center)
        .background(Color(red: 0.949, green: 0.945, blue: 0.965).edgesIgnoringSafeArea(.horizontal))
    }
    
    private var middleScrollView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                KFImage(viewModel.firstImageUrl)
                    .resizable()
                    .scaledToFit()
                
                HStack(alignment: .center, spacing: 10) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "tag")
                                .foregroundColor(.pink)
                            Text("資生堂")
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.pink)
                        }
                        
                        Text(viewModel.response?.name ?? "")
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color(red: 0.949, green: 0.945, blue: 0.965))
                            .clipShape(Circle())
                        Image(systemName: "heart")
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color(red: 0.949, green: 0.945, blue: 0.965))
                            .clipShape(Circle())
                    }
                }
                
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("NT$ 1644.14")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .strikethrough()
                    
                    HStack(alignment: .bottom, spacing: 6) {
                        Text("NT$ 1644.14")
                            .font(.system(size: 20))
                            .foregroundColor(.pink)
                            .bold()
                        
                        if let price = viewModel.response?.price {
                            Text("NT$ \(price)")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                        }
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("免稅價格")
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                }
                
                Group {
                    HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "cart")
                        Text("每筆訂單限購20件")
                    }
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(alignment: .top, spacing: 4) {
                            Image(systemName: "timer")
                            Text("8小時27分鐘 前訂購、最快可於2023/04/14 13:00:00 取貨。 (JR成田機場站)")
                        }
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        
                        HStack {
                            Spacer()
                            Button {
                                print("ButtonTapped")
                            } label: {
                                Text("選擇取貨機場")
                                    .foregroundColor(.pink)
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("商品說明")
                            .bold()
                        Text(viewModel.response?.description ?? "")
                            .lineLimit(3)
                        
                        HStack {
                            Spacer()
                            Button {
                                print("ButtonTapped")
                            } label: {
                                Text("看更多")
                                    .foregroundColor(.pink)
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("內容量")
                            .bold()
                        Text(viewModel.response?.netContent ?? "")
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("成分/原材料")
                            .bold()
                        Text(viewModel.response?.ingredient ?? "")
                            .lineLimit(3)
                        
                        HStack {
                            Spacer()
                            Button {
                                print("ButtonTapped")
                            } label: {
                                Text("看更多")
                                    .foregroundColor(.pink)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    private var bottomActionArea: some View {
        HStack {
            Button(action: {
                viewModel.decreaseQuantity()
            }) {
                Image(systemName: "minus").foregroundColor(.black)
            }
            
            Text("\(viewModel.quantity)")
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(Color(red: 0.949, green: 0.945, blue: 0.965))
                .cornerRadius(6)
                .padding(.horizontal, 10)
            
            Button(action: {
                viewModel.increaseQuantity()
            }) {
                Image(systemName: "plus").foregroundColor(.black)
            }
            
            Spacer(minLength: 10)
            
            Button {
                print("cart")
            } label: {
                HStack {
                    Image(systemName: "cart")
                        .font(.title2)
                    Text("加入購物車")
                        .font(.title2)
                }
                .padding(EdgeInsets(top: 14, leading: 26, bottom: 14, trailing: 26))
                .foregroundColor(.white)
                .background(.pink)
                .cornerRadius(8)
            }
        }
        .frame(height: 65)
        .padding()
        .overlay(
            Divider()
                .background(.black),
            alignment: .top
        )
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView()
    }
}
