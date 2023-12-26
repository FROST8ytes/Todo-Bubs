//
//  CustomButtonView.swift
//  Todo Bubs
//
//  Created by Ammar Farhan Mohamad Rizam on 27/12/2023.
//

import SwiftUI

struct CustomButtonView: View {
    let label: String
    let textColor: Color
    let buttonColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: { action() }) {
            Text(label)
                .font(.headline)
                .foregroundStyle(textColor)
                .padding([.top, .bottom])
                .contentShape(RoundedRectangle(cornerRadius: 15.0))
                .frame(maxWidth: .infinity)
                .background(buttonColor)
                .cornerRadius(15.0)
                .shadow(radius: 10.0, x: 20, y: 10)
        }
    }
}

#Preview {
    CustomButtonView(label: "Sign In", textColor: .white, buttonColor: .green, action: {})
}
