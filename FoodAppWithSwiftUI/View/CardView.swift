//
//  CardView.swift
//  FoodAppWithSwiftUI
//
//  Created by park kyung seok on 2021/06/20.
//

import SwiftUI

struct CardView: View {
    
    var item: Item
    
    @ObservedObject var tabData: TabViewModel
    var animation: Namespace.ID
    
    var body: some View {
        
        HStack {
            VStack (alignment: .leading, spacing: 10)  {
                Text(item.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text(item.price)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        tabData.selectedItem = item
                        tabData.isDetail.toggle()
                    }
                    
                }, label: {
                    Text("Buy Now")
                        .fontWeight(.heavy)
                        .foregroundColor(Color(item.image))
                        .padding(.vertical)
                        .padding(.horizontal, 25)
                        .background(Color.white)
                        .cornerRadius(15)
                })
                .padding()
            }
            .padding(.leading, 10)
            .offset(y: 27)
            Spacer(minLength: 0)
            
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height / 3, alignment: .center)
                .matchedGeometryEffect(id: item.image, in: animation)
            
        }
        .padding()
        .background(Color(item.image)
                        .cornerRadius(25)
                        .padding(.top, 60)
        )
        
        
        
    }
}

//
