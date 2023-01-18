//
//  ContentView.swift
//  Weather
//
//  Created by Giovanna Danelli Pau on 17/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .red]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("São Carlos, SP")
                    .font(.system(size: 32, weight: .medium, design: .serif))
                    .foregroundColor(.white)
                    .padding()
//                enche todo o espaço
                VStack(spacing: 10){
                    Image(systemName: "cloud.moon.rain.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("25ºC")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 50)
                
                HStack(spacing: 20){
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "smoke.fill",
                        temperature: 23)
                    
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sun.max.fill",
                        temperature: 29)
                    
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "sun.max.fill",
                        temperature: 30)
                    
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "cloud.heavyrain.fill",
                        temperature: 18)
                    
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "smoke.fill",
                        temperature: 20)
                }
                
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 200, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)ºC")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
