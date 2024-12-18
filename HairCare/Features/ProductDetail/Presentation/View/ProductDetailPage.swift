//
//  ProductDetailPage.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 22/06/22.
//

import SwiftUI

struct ProductDetailPage<VModel: ProductDetailViewModelProtocol>: View, WithViewModel {
    
    @EnvironmentObject var cartService: CartService

    @StateObject var viewModel: VModel
    @State private var numberOfPickedItems: Int = 1

    
    var body: some View {
        FixedBottomSheetView(
            content: {
            ScrollView {
                VStack(spacing: 20){
                    HStack {
                        CategoryProductNameView(
                            category: viewModel.category.localizedName,
                            name: viewModel.name,
                            style: .large
                        )
                        Spacer()
                    }
                    HStack(alignment: .top){
                        Image(R.image.sampleProduct2.name)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        ProductDetailIngredientsView()
                            .overlay {
                                LinearGradient(colors: [
                                    Color.systemBackground.opacity(0),
                                    Color.systemBackground.opacity(1)
                                ], startPoint: UnitPoint(x: 0.5, y: 0.8), endPoint: UnitPoint(x: 0.5, y: 1))
                            }
                    }
                    ProductDetailDescriptionView()
                }
                .padding()
            }
        }, bottomSheetContent: {
            ProductDetailFooterView(
                price: viewModel.price,
                numberOfChoosedItems: $numberOfPickedItems,
                onAddToCartButtonClick: {
                    addItemToCart()
                }
            )
        })
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(R.string.productDetail.details())
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .rotationEffect(Angle.degrees(90))

                }
            }
        }
    }
    
    private func addItemToCart() {
        let cartItem = CartItem(item: viewModel.product, amount: numberOfPickedItems)
        cartService.addProduct(cartItem)
    }
}

struct ProductDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailPage(viewModel: ProductDetailViewModelFactory.makeProductDetailViewModel(
                product: Product(id: "00",
                                 name: "Product",
                                 imageUrl: nil,
                                 category: .shampoo,
                                 price: Price(valueInCents: 4498,
                                              currency: "$")
                                )
            ))
        }
        
    }
}
