//
//  DetailCard.swift
//  Countries
//
//  Created by Batuhan Mıcık on 25.02.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailCard: View {
    @ObservedObject var networkService = NetworkService()
    @EnvironmentObject var favorites: Functions
    @State var countryDetails: CountryDetail?
    var updateSaved: Binding<Bool>?
    let countryCode: String
    
    var body: some View {
        VStack {
            if countryDetails?.data == nil {
                ProgressView()
            } else {
                ScrollView{
                    if let unwrappedDetail = countryDetails?.data {
                        VStack(spacing: 50) {
                            WebImage(url: URL(string: unwrappedDetail.flagImageURL))
                                .resizable()
                                .scaledToFit()
                            
                            HStack {
                                Text("Country Code:")
                                    .font(.system(size: 18))
                                Text(unwrappedDetail.code)
                            }
                            Link("For more information", destination: URL(string: "https://www.wikidata.org/wiki/\(unwrappedDetail.wikiDataID)")!)
                                .buttonStyle(Buttons())
                            
                        }
                    }
                }
            }
        }
        .onAppear{
            NetworkService().fetchCountryDetails( countryCode: countryCode) { (countryDetails) in
                self.countryDetails = countryDetails
            }
        }.onDisappear{
            self.updateSaved?.wrappedValue = true
        }
        .navigationTitle(countryDetails?.data.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button{
                favorites.toggle(countryCode)
            } label: {
                Image(systemName: favorites.contains(countryCode) ? "star.fill" : "star")
            }
        }.buttonStyle(PlainButtonStyle())
    }
}





