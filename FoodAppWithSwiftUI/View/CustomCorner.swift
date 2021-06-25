//
//  CustomCorner.swift
//  FoodAppWithSwiftUI
//
//  Created by park kyung seok on 2021/06/25.
//

import SwiftUI

struct CustomCorner: Shape {
    
    let cornerRadii: CGSize
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: cornerRadii)
        return Path(path.cgPath)
    }
    
}
