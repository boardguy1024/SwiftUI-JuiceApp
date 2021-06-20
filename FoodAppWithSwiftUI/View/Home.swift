//
//  Home.swift
//  FoodAppWithSwiftUI
//
//  Created by park kyung seok on 2021/06/20.
//

import SwiftUI

struct Home: View {
    
    @State var items = [
        Item(title: "Besom Lemon Juice", price: "$25.99", discount: "7%", image: "p1"),
        Item(title: "Besom Lemon Juice", price: "$15.99", discount: "25%", image: "p2"),
        Item(title: "Besom Lemon Juice", price: "$20.99", discount: "10%", image: "p3")
    ]
    
    var body: some View {
        
        VStack {
            
            ZStack {
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Image(systemName: "bag")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                    }
                }
                
                Text("Besom")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }
            .background(Color.blue)
            .padding()
            
            ScrollView(.vertical, content: {
            
                VStack (spacing: 20) {
                    ForEach(items) { item in
                        CardView(item: item)
                    }
                }
            })
            .padding()
           
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Model and Model Data


