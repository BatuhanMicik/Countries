//
//  FavoritesView.swift
//  Countries
//
//  Created by Batuhan Mıcık on 25.02.2022.
//

import SwiftUI

struct SavedCard: View {
    @EnvironmentObject var saved: Functions
    @Binding var countries: Countries?
    @State var localSaved = Set<String>()
    @State var updateSaved: Bool = false
    
    var body: some View {
        VStack{
            if countries?.data == nil {
                ProgressView()
            } else {
                NavigationView {
                    if let Data = countries?.data {
                        let newData = Data.filter({localSaved.contains($0.code)})
                        VStack{
                            ForEach(newData) { country in
                                NavigationLink(destination: DetailCard(updateSaved: $updateSaved, countryCode: country.code)) {
                                    HStack{
                                        HStack {
                                            Text(country.name)
                                            Spacer()
                                            
                                            Button {
                                                saved.toggle(country.code)
                                                self.localSaved = saved.countryCodes
                                            } label: {
                                                Image(systemName: saved.contains(country.code) ? "star.fill" : "star")
                                            }.buttonStyle(PlainButtonStyle())
                                        }
                                        .padding()
                                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.black))
                                        .foregroundColor(.black)
                                        
                                    }
                                    .padding([.top, .bottom], 2)
                                    .padding([.trailing, .leading], 10)
                                }
                            }
                            Spacer()
                        }
                        .listStyle(PlainListStyle())
                        .navigationBarTitle("Countries", displayMode: .inline)
                    }
                }.onAppear{
                    self.localSaved = saved.countryCodes
                }.onChange(of: updateSaved) { _ in
                    if updateSaved {
                        self.localSaved = saved.countryCodes
                        updateSaved = false
                    }
                }
            }
        }
    }
}


