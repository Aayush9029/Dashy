//
//  ContentView.swift
//  LightiFy
//
//  Created by Aayush Pokharel on 2020-12-13.
//

import SwiftUI

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct ContentView: View {
    let keys = colorValues.map{$0.key}
    let values = colorValues.map {$0.value}
    @State var temp =  RoomTempData(temperature: 20.00, humidity: 50.00)
    
    let columns = [
        GridItem(.adaptive(minimum: 90))
    ]
    
    var body: some View {
        VStack {
            
            
            ScrollView {
                
                HStack{
                    VStack{
                        HStack{
                            
                            Text("Hi, Aayush")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            
                        }
                        HStack{
                            
                            HStack (spacing:4){
                            Text("Room temperature is")
                                Text("\(temp.temperature ?? 0.00, specifier: "%.2f")°C ")
                                    .foregroundColor(.red)
                                    .fontWeight(.bold)

                                Text("and humidity is")
                                Text("\(temp.humidity ?? 0.00 , specifier: "%.0f")% ")
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)

                            }
                            
                            
                            Spacer()
                            
                        }
                    }
                    .padding()
                    
                    Spacer()
                    Image(systemName: "gear")
                        .padding(5)
                    Image(systemName: "square.and.arrow.up")
                        .padding(5)
                }
                .padding()
                .padding(.top)
                .onAppear(perform: {
                 getWeather()
                })
                
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
                }
                .padding()

                
            }
        }
        .background( LinearGradient(Color("top-background"),Color("bottom-background"))).edgesIgnoringSafeArea(.all)
    }
    
}

struct RoomTempData: Decodable {
    let temperature: Double?
    let humidity: Double?
}

extension ContentView{
    func getWeather(){
        let url = URL(string: "http://192.168.1.210/weather")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let weather_data = try decoder.decode(RoomTempData.self, from: data)
                temp = weather_data
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
