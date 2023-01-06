//
//  CountryListViewModel.swift
//  KarooooDemo
//
//  Created by Muzaffar on 03/01/23.
//

import Foundation


class CountryListViewModel {
    
    var countriesList : [Country]
    
    init() {
        countriesList = [Country]()
        countriesList.append(contentsOf:self.fetchCountryList())
    }
    
    func fetchCountryList() -> [Country]{
        
        var countriesData = [Country]()
        for code in NSLocale.isoCountryCodes  {

            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            if let name = NSLocale(localeIdentifier: CTConstans.localeIdentifier ).displayName(forKey: NSLocale.Key.identifier, value: id) , let flag = String.emojiFlag(for: code){
                countriesData.append(Country(name: name, flag: flag))
            } 
        }
        return countriesData
        
    }
}
