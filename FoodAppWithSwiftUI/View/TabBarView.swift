//
//  TabBarView.swift
//  FoodAppWithSwiftUI
//
//  Created by park kyung seok on 2021/06/20.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject var tabData = TabViewModel()
    @Namespace var animation
    
    var body: some View {
        
        ZStack {
            TabView {
                Home(tabData: tabData, animation: animation)
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
            
            if tabData.isDetail {
                Detail(tabData: tabData, animation: animation)
            }
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
