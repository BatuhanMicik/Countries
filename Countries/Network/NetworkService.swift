//
//  NetworkManager.swift
//  Countries
//
//  Created by Batuhan Mıcık on 24.02.2022.
//

import Foundation

class NetworkService : ObservableObject {
        
    func fetchCountries(completion:@escaping (Countries) -> ()){
        let headers = [
            "x-rapidapi-host": Constants.host,
            "x-rapidapi-key": Constants.key
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10&offset=\(Int.random(in: 0...195))")! as URL)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(Countries.self, from: data)
                    DispatchQueue.main.async{
                        completion(result)
                    }
                }else{
                    print("There is no data")
                }
            }
            catch(let error){
                debugPrint(error)
            }
        }).resume()
        
    }
    func fetchCountryDetails(countryCode : String, completion:@escaping (CountryDetail) -> ()){
        let headers = [
            "x-rapidapi-host" : Constants.host,
            "x-rapidapi-key" : Constants.key
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(countryCode)")! as URL)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(CountryDetail.self, from: data)
                    DispatchQueue.main.async {
                        completion(result)
                    }
                } else {
                    print("No data")
                }
            }
            catch(let error) {
                debugPrint(error)
            }
        }).resume()
    }
}
