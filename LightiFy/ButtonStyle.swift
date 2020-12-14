//
//  ButtonStyle.swift
//  LightiFy
//
//  Created by Aayush Pokharel on 2020-12-13.
//

import SwiftUI


struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    @Environment(\.colorScheme) var colorScheme

//    LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 4)
    
    var body: some View {
        if (colorScheme == .dark){
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                          .overlay(shape.stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 4))
                          .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                          .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)

            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    
    }else{
    ZStack {
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
}
}

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .contentShape(  RoundedRectangle(cornerRadius: 10))
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape:   RoundedRectangle(cornerRadius: 10)))
            
    }
}



extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}



extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
}
