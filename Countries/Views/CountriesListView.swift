//
//  CountryListing.swift
//  Countries
//
//  Created by Batuhan Mıcık on 25.02.2022.
//

import SwiftUI

struct CountriesListView: View {
    
    @EnvironmentObject var saved: Functions
    @Binding var countries: Countries?
    
    var body: some View {
        VStack{
            if countries?.data == nil {
                ProgressView()
            } else {
                NavigationView {
                    if let Data = countries?.data {
                        VStack{
                            VStack{
                                ForEach(Data) { country in
                                    NavigationLink(destination: DetailCard(countryCode: country.code)) {
                                        HStack{
                                            HStack {
                                                Text(country.name)
                                                Spacer()
                                                Button {
                                                    saved.toggle(country.code)
                                                } label: {
                                                    Image(systemName: saved.contains(country.code) ? "star.fill" : "star")
                                                }.buttonStyle(PlainButtonStyle())
                                            } .padding()
                                            
                                                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.black))
                                            
                                                .foregroundColor(.black)
                                            
                                            
                                        }.padding([.top, .bottom], 2)
                                            .padding([.trailing, .leading], 10)
                                    }
                                }
                                Spacer()
                            }
                        }
                        .navigationBarTitle("Countries", displayMode: .inline)
                    }
                }
            }
        }
    }
}


