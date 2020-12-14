//
//  CardView.swift
//  LightiFy
//
//  Created by Aayush Pokharel on 2020-12-13.
//

import SwiftUI

struct SmallCardView: View {
    var color: Color
    var color_name: String
    var color_name_full: String
    
    var body: some View {
        VStack{
            Button(action: {
                sendRequest(color_full_name: color_name_full)
            }) {
                VStack{
                    Image(systemName: "rectangle.fill")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .leading)
                        .shadow(color: color.opacity(0.5), radius: 5, x: -2, y: -2)
                        .foregroundColor(color)
                }
          }
            .buttonStyle(DarkButtonStyle())
            
        }

    }
    
    func sendRequest(color_full_name: String){
        let url = URL(string: "http://192.168.1.210/strip?color=\(color_full_name)")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
    
}


struct SmallCardView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCardView(color: Color(hex: 0x339399), color_name: "Teal", color_name_full: "Teal")
    }
}
