//
//  Home.swift
//  FB Mac (iOS)
//
//  Created by Balaji on 14/12/20.
//

import SwiftUI

struct Home: View {
    
    @State var selected = "person"
    @Namespace var animation
    
    
    var body: some View {
        
        VStack{
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
                HStack{
                    
                    Text("Dashy")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("fb"))
                        .padding()
                    
                    Spacer()
                }
                .padding(.vertical)
                .padding(.leading,10)
                .padding(.trailing)
                .padding(.top,12)
                .background(Color.offWhite_tab).edgesIgnoringSafeArea(.all)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 5)
                // Tab View....
                
                HStack{
                    
                    TabButton(image: "person", selected: $selected, animation: animation)
                    
                    TabButton(image: "lightbulb", selected: $selected, animation: animation)
                    
                    TabButton(image: "newspaper", selected: $selected, animation: animation)
                    
                                        
                    TabButton(image: "gear", selected: $selected, animation: animation)
                }
            }
            
            HStack{
                 if selected == "person"{
                    WeatherView()
                }else if selected == "lightbulb"{
                    ColorPickerView()

                }else if selected == "newspaper"{
                    Text("news")
                }else if selected == "gear"{
                    Text("gear")
                }else{
                   Text("Person")
                }
            }
            .frame(maxHeight: .infinity)
        }
                .background(Color.offWhite).edgesIgnoringSafeArea(.all)
        .preferredColorScheme(.light)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}













