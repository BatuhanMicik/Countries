//
//  CountriesApp.swift
//  Countries
//
//  Created by Batuhan Mıcık on 23.02.2022.
//

import SwiftUI
import SDWebImage
import SDWebImageSVGCoder

@main
struct CountriesApp: App {
    init(){
        setUpDependencies()
    }
    var body: some Scene {
        WindowGroup {
            HomePage()
        }
    }
}

private extension CountriesApp{
    func setUpDependencies(){
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
}
