//
//  ContentView.swift
//  Weather
//
//  Created by Giovanna Danelli Pau on 17/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(
                topColor: isNight ? .black : .blue,
                bottomColor: isNight ? .gray : .red)
            
            VStack{
                CityTextView(nameCity: "São Carlos, SP")
                
                MainWeatherStatusView(
                    imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                    temperature: 25)
                
                HStack(spacing: 20){
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "smoke.fill",
                        temperature: 23)
                    
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: isNight ? "moon.stars.fill" : "sun.max.fill",
                        temperature: 29)
                    
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: isNight ? "moon.stars.fill" : "sun.max.fill",
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
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .purple, backgroundColor: .white)
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

struct BackgroundView: View {

    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var nameCity: String
    
    var body: some View {
        
        Text(nameCity)
            .font(.system(size: 32, weight: .medium, design: .serif))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)ºC")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
        
    }
}


