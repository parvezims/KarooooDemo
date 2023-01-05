//
//  CountryListViewController.swift
//  KarooooDemo
//
//  Created by Muzaffar on 03/01/23.
//

import Foundation
import UIKit

protocol CountrySelection : AnyObject {
    func selectedCountry(country: Country)
}

class CountryListViewController : UIViewController , Storyboard {
    
    @IBOutlet var tableView : UITableView!
    weak var countryDelegate : CountrySelection?
    
    var countryViewModel = CountryListViewModel()
    override func viewDidLoad() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellConstants.country)
        self.navigationController?.isNavigationBarHidden = true
    }
}


extension CountryListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.countryViewModel.countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellConstants.country, for: indexPath)
        let country = self.countryViewModel.countriesList[indexPath.row]
        cell.textLabel?.text = "\(country.name) \(country.flag)"
        return cell
        
    }
}

extension CountryListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = countryDelegate{
            delegate.selectedCountry(country: self.countryViewModel.countriesList[indexPath.row])
            self.dismiss(animated: true, completion: nil)
        }
    }
}

