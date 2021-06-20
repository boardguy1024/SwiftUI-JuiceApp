//
//  TabBarView.swift
//  FoodAppWithSwiftUI
//
//  Created by park kyung seok on 2021/06/20.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                }
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Like")
                .tabItem {
                    Image(systemName: "heart")
                }
            
            Text("Home")
                .tabItem {
                    Image(systemName: "person")
                }
            
        }.accentColor(.black)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
