//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ankit Sharma on 06/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    init() {
        weatherViewModel = WeatherViewModel()
    }
    
    
    var body: some View {
        VStack (alignment: .center) {
            TextField("Search City", text: $weatherViewModel.cityName) {
                weatherViewModel.search()
            }.font(.custom("Arial", size: 50))
                .padding()
                .fixedSize()
            
            
            Text(weatherViewModel.temperature)
                .font(.custom("Arial", size: 100))
                .foregroundColor(.green)
                .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
