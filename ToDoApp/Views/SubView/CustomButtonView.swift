//
//  CustomButtonView.swift
//  ToDoApp
//
//  Created by Haktan Can Taşkıran on 24.03.2024.
//

import SwiftUI

struct CustomButtonView: View {
    let text: String
    let bgColor: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(bgColor)
                Text(text)
                    .foregroundStyle(.white).bold()
            }.padding()
        }
    }
}
    #Preview {
        CustomButtonView(text: "Text", bgColor: .blue) {
            //
        }
}
