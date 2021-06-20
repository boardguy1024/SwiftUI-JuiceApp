//
//  Item.swift
//  FoodAppWithSwiftUI
//
//  Created by park kyung seok on 2021/06/20.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var title: String
    var price: String
    var discount: String
    var image: String
}

var items = [
    Item(title: "Besom Lemon Juice", price: "$25.99", discount: "7%", image: "p1"),
    Item(title: "Besom Lemon Juice", price: "$15.99", discount: "25%", image: "p2"),
    Item(title: "Besom Lemon Juice", price: "$20.99", discount: "10%", image: "p3"),
]
