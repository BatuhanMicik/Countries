//
//  Favorites.swift
//  Countries
//
//  Created by Batuhan Mıcık on 25.02.2022.
//

import SwiftUI

class Functions : ObservableObject{
    var countryCodes : Set<String>
    
    let Key = "Functions"
    
    init(){
        self.countryCodes = []
        self.load()
    }
    
    func contains(_ countryCode: String) -> Bool{
        countryCodes.contains(countryCode)
    }
    func add(_ countryCode: String){
        objectWillChange.send()
        countryCodes.insert(countryCode)
        save()
    }
    func remove(_ countryCode: String){
        objectWillChange.send()
        countryCodes.remove(countryCode)
        save()
    }
    func save(){
        do{
            let file = getDocDirectory().appendingPathComponent("SavedCountries")
            let countryID = Array(self.countryCodes)
            let data = try JSONEncoder().encode(countryID)
            try data.write(to: file, options: [.atomicWrite, .completeFileProtection])
            print("Country data saved")
        } catch{
            print("Unable to save")
        }
    }
    func getDocDirectory() -> URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    func load(){
        let file = getDocDirectory().appendingPathComponent("SavedCountries")
        do{
            let data = try Data(contentsOf: file)
            let countryId = try JSONDecoder().decode([String].self, from: data)
            countryCodes = Set(countryId)
        } catch {
            print("Unable to load.")
        }
    }
    func toggle(_ countryCode: String){
        if self.contains(countryCode){
            self.remove(countryCode)
        }else{
            self.add(countryCode)
        }
    }
}
