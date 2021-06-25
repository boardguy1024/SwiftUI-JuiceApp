//
//  TabViewModel.swift
//  FoodAppWithSwiftUI
//
//  Created by park kyung seok on 2021/06/22.
//

import SwiftUI

class TabViewModel: ObservableObject {
    @Published var selectedItem: Item!
    @Published var isDetail = false
}
