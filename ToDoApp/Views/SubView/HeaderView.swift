//
//  HeaderView.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 24.03.2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let bgColor: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(bgColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                
                if angle == 15 {
                    Text("(if you have a bad memory)")
                        .font(.system(size: 12))
                        .foregroundStyle(.white)
                }
            }.padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Titl;e", subtitle: "Subtitle", angle: 15, bgColor: .blue)
}
