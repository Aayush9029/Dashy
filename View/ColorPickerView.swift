//
//  ColorPickerView.swift
//  FB Mac (macOS)
//
//  Created by Aayush Pokharel on 2020-12-15.
//


import SwiftUI
import Foundation

struct ColorPickerView: View {
    let keys = colorValues.map{$0.key}
    let values = colorValues.map {$0.value}
    
    let columns = [
        GridItem(.adaptive(minimum: 90))
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    ForEach(keys.indices) {index in
                        VStack{
                            SmallCardView(color: Color(hex: UInt(values[index])), color_name: keys[index].camelCaseToTitleCase(), color_name_full: keys[index])
                                .padding(.horizontal)
                            Text(keys[index].camelCaseToTitleCase())
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .frame(width: 100, height: 40)

                        }
                        .frame(width: 80, height: 100, alignment: .center)
                    }
                Text("asd")
                }
                .padding()
            }
//        }

    }
}
}



struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView().preferredColorScheme(.light)
    }
}
