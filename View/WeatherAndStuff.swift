//
//  WeatherAndStuff.swift
//  FB Mac (macOS)
//
//  Created by Aayush Pokharel on 2020-12-15.
//


import SwiftUI
import Charts

struct WeatherView: View {
    @State var temp =  RoomTempData(temperature: 22.00, humidity: 50.00)
    
    @State var temp_data_array: [Double] = [0.00]
    @State var humid_data_array: [Double] = [0.00]
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    
                    Text("Hi, Aayush")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                }.padding(.top)
                
                HStack (spacing:4){
                    Text("Room temperature is")
                    Text("\(temp.temperature ?? 0.00, specifier: "%.2f")°C ")
                        .foregroundColor(.orange)
                        .fontWeight(.bold)
                    
                    Text("and humidity is")
                    Text("\(temp.humidity ?? 0.00 , specifier: "%.0f")% ")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                    
                }.font(.title2)
                .foregroundColor(.gray)
            }
            .padding(.top)
            
            HStack{
                VStack{
                    Text("Temperature")
                        .foregroundColor(.orange)
                        .font(.title2)
                    
                    
                    Chart(data: [0.1, 0.3, 0.2, 0.5, 0.4, 0.9, 0.1])
                        .chartStyle(
                            AreaChartStyle(.quadCurve, fill:
                                            LinearGradient(gradient: .init(colors: [Color.red.opacity(1), Color.orange.opacity(0.05)]), startPoint: .top, endPoint: .bottom)
                            )
                        )
                }
                .frame(width: 400, height: 200)
                .padding()
                .background(Color.offWhite)
                .shadow(color: Color.orange.opacity(0.1), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .border(Color.orange)
                .padding()
                
                VStack{
                    Text("Humidity")
                        .font(.title2)
                        
                        .foregroundColor(.blue)
                    
                    Chart(data: [0.9, 0.3, 0.2, 0.6, 0.4, 0.2, 0.2])
                        .chartStyle(
                            AreaChartStyle(.quadCurve, fill:
                                            LinearGradient(gradient: .init(colors: [Color.blue.opacity(1), Color.blue.opacity(0.05)]), startPoint: .top, endPoint: .bottom)
                            )
                        )
                }
                .frame(width: 400, height: 200)
                .padding()
                .background(Color.offWhite)
                .shadow(color: Color.blue.opacity(0.1), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .border(Color.blue)
                .padding()
                
            }
            .padding()
            .padding(.top)
            .onAppear(perform: {
                //               Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                //                        getWeather()
                //                print("fetching weather")
                //                    }
                //                getWeather()
            })
            padding()
//            Group{
//
//                HStack{
//                    VStack{
//                        Text("Device Name: Microphippy")
//                        Text("Model Name : Node Mcu v3")
//                    }.foregroundColor(.black)
//                    .padding()
//                    .background(Color.offWhite)
//                    .shadow(color: Color.blue.opacity(0.1), radius: 10, x: 10, y: 10)
//                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
//                    .border(Color.blue)
//                Spacer()
//                }.padding()
//            }
            Spacer()
            
//            Toggle(isOn: $live_update) {
//                Text("Show welcome message")
//            }.padding()

        } .background(Color.offWhite).edgesIgnoringSafeArea(.all)
        
    }
    
}




struct RoomTempData: Decodable {
    let temperature: Double?
    let humidity: Double?
}


extension WeatherView{
    func getWeather(){
        
        let url = URL(string: "http://192.168.1.210/weather")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let weather_data = try decoder.decode(RoomTempData.self, from: data)
                temp = weather_data
                
                temp_data_array.append((weather_data.temperature ?? 0) / 100)
                humid_data_array.append((weather_data.humidity ?? 0) / 100)
            } catch {
                print(error)
            }
        }
        task.resume()
        
    }
}


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
