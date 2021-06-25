//
//  Detail.swift
//  FoodAppWithSwiftUI
//
//  Created by park kyung seok on 2021/06/22.
//

import SwiftUI

struct Detail: View {
    @ObservedObject var tabData: TabViewModel
    @State var start = false
    @State var cart: Int = 0
    
    // for hero animation
    var animation: Namespace.ID
    var body: some View {
        VStack {
            
            VStack {
                
                ZStack {
                    HStack {
                        Button(action: {
                            
                            withAnimation(Animation.easeIn(duration: 0.5)) {
                                start.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.spring()) {
                                        tabData.isDetail.toggle()
                                    }
                                }
                            }
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 24, weight: .heavy))
                                .foregroundColor(.white)
                        }
                        Spacer()

                        Button(action: { }) {
                            Image(systemName: "bag")
                                .font(.system(size: 24, weight: .heavy))
                                .foregroundColor(.white)
                        }
                    }
                    Text("Besom")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                .padding()
                
                // Juice Images
                ZStack {
                    // rotating view after view appears
                    Image(tabData.selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.height / 3)
                        .rotationEffect(.init(degrees: start ? -25 : 0), anchor: .bottom)
                        .offset(x: 0, y: start ? -15 : 0)
                        .opacity(start ? 1: 0)
                    
                    Image(tabData.selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.height / 3)
                        .rotationEffect(.init(degrees: start ? 25 : 0), anchor: .bottom)
                        .offset(x: 0, y: start ? -15 : 0)
                        .opacity(start ? 1: 0)
                    
                    Image(tabData.selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: tabData.selectedItem.image, in: animation)
                        .frame(height: UIScreen.main.bounds.height / 3)
                        .padding(.vertical, 25)
                    
                }
                .padding(.bottom, 12)
               
            }
            .background(Color(tabData.selectedItem.image).clipShape(CustomCorner(cornerRadii: .init(width: 35, height: 35))).ignoresSafeArea())
            
            // + | - Buttons
            HStack(spacing: 8) {
                Button(action: {
                    cart = cart <= 0 ? 0 : cart - 1
                }) {
                    Image(systemName: "minus")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Text("\(cart)")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button(action: {
                    cart = cart + 1
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                }

            }
            .padding(.vertical)
            .padding(.horizontal, 25)
            .background(Color(tabData.selectedItem.image))
            .cornerRadius(15)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 2)
            )
            .offset(x: 0, y: -36)
            

            VStack {
                
                // Descriptions
                HStack {
                    Text(tabData.selectedItem.title)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 6) {
                        ForEach(1...5, id: \.self) { i in
                              Image(systemName: "star.fill")
                                .font(.system(size: 18))
                                .foregroundColor(i <= 4 ? Color.yellow : Color.black.opacity(0.5))
                        }
                    }
                }
                .padding(.horizontal)

                Text("Driking Orange Juice is not only enhances health body also strenghness muscles.")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding()
                
//                // Reviews
//                HStack {
//                    Text("Reviews")
//                        .font(.title3)
//                        .fontWeight(.heavy)
//                        .foregroundColor(.black)
//
//                    Spacer(minLength: 0)
//
//                    Button(action: { }) {
//                        Text("See All")
//                            .fontWeight(.bold)
//                            .foregroundColor(.pink)
//                    }
//                }
//                .padding()
                
                HStack {
                    ForEach(1...4, id: \.self) { i in
                        
                        Image("r\(i)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .cornerRadius(10)
                        
                        Spacer()
                    }
                  
                    Button(action: { }) {
                        Image(systemName: "plus")
                            .foregroundColor(.pink)
                            .frame(width: 55, height: 55)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.pink, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [10, 10]))
                            )
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                Spacer(minLength: 0)
                
                HStack {
                    Text(tabData.selectedItem.price)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Buy Now")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .padding(.horizontal, 25)
                            .background(Color(tabData.selectedItem.image))
                            .cornerRadius(15)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .offset(x: 0, y: -20)
            
        }.background(Color.white .ignoresSafeArea())
        .onAppear {
            withAnimation(Animation.easeIn.delay(0.5)) {
                start.toggle()
            }
        }
    }
}
