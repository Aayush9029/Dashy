//
//  ButtonStyle.swift
//  LightiFy
//
//  Created by Aayush Pokharel on 2020-12-13.
//

import SwiftUI


struct NeuButton<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {

        Group {
            if isHighlighted {
               shape
                    .fill(Color.offWhite)
                    .overlay(
                        Rectangle()
                            .stroke(Color.gray, lineWidth: 4)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                            .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(Color.black, Color.clear)))
                    )
                    .overlay(
                       shape
                            .stroke(Color.white, lineWidth: 8)
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                            .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(Color.clear, Color.black)))

                    )
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            }
        }

        }
    }



struct NeuButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .contentShape(  RoundedRectangle(cornerRadius: 10))
            .background(
                NeuButton(isHighlighted: configuration.isPressed, shape:   RoundedRectangle(cornerRadius: 10)))
            
    }
}



extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}



extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let offWhite_tab =   Color(red: 235 / 255, green: 235 / 255, blue: 245 / 255)
}
