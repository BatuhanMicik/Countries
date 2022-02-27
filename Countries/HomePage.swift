//
//  ContentView.swift
//  Countries
//
//  Created by Batuhan Mıcık on 23.02.2022.
//

import SwiftUI

struct HomePage: View {
    @State var countries: Countries?
    @ObservedObject var favorites = Functions()
    
    var body: some View {
        TabView {
            CountriesListView(countries: $countries)
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            SavedCard(countries: $countries)
                .tabItem{
                    Label("Saved", systemImage: "heart.fill")
                }.background(.gray)
        }.onAppear{
            NetworkService().fetchCountries { (countries ) in
                self.countries = countries
            }
        }.environmentObject(favorites)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
