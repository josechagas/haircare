//
//  CartService.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 30/06/22.
//

import Foundation

class CartService: ObservableObject {
    @Published private(set) var products: [CartItem<Product>] = []
    @Published private(set) var packs: [CartItem<Pack>] = []

    func addPack(_ pack: CartItem<Pack>) {
        addItem(
            pack,
            list: &packs
        )
    }
    
    func addProduct(_ product: CartItem<Product>) {
        addItem(
            product,
            list: &products
        )
    }
    
    func removePack(_ packId: String) throws {
        try removeItem(
            packId,
            list: &packs
        )
    }
    
    func removeProduct(_ productId: String) throws {
        try removeItem(
            productId,
            list: &products
        )
    }
    
    private func addItem<T: StoreItem>(_ item: CartItem<T>, list: inout [CartItem<T>]) {
        if let index = list.firstIndex(where: {$0.item.id == item.item.id}) {
            list[index].amount += 1
        }
        else {
            list.append(item)
        }
    }
    
    private func removeItem<T: StoreItem>(_ itemId: String, list: inout [CartItem<T>]) throws {
        if let index = list.firstIndex(where: {$0.item.id == itemId}) {
            let item = list[index]
            if item.amount > 1 {
                list[index].amount  -= 1
            }
            else {
                list.remove(at: index)
            }
        }
        else {
            throw CartServiceErrors.itemNotFound
        }
    }
}


enum CartServiceErrors: Error {
    case itemNotFound
}
