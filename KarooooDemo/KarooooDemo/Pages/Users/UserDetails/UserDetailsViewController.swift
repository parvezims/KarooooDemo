//
//  UserDetailsViewController.swift
//  KarooooDemo
//
//  Created by Muzaffar on 04/01/23.
//

import Foundation


import Foundation
import UIKit
import MapKit

class UserDetailsViewController : UIViewController , Storyboard {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblUsername: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblWebsite: UILabel!
    @IBOutlet var lblCompany: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblPhone: UILabel!
    @IBOutlet var mapView : MKMapView!
    
    weak var mainCoordinator : MainCoordinator?
    var user : User?
    
    func setUser(user: User) {
        self.user = user
    }
    
    override func viewDidLoad() {
        setupView()
    }
    
    func setupView() {
        
        if let user = self.user {
           
            lblName.text = user.name
            lblUsername.text = user.username
            lblEmail.text = user.email
            lblWebsite.text = user.email
            lblPhone.text = user.phone
            
            lblCompany.text = "\(user.company.name): \( user.company.catchPhrase), \(user.company.bs)"
            lblAddress.text = "\(user.address.street), \(user.address.suite), \(user.address.city), \(user.address.zipcode)"
            
            
            if let lat = Double(user.address.geo.lat), let lng = Double(user.address.geo.lng) {
               
                print(lat,lng)
                let center = CLLocationCoordinate2D(latitude:lat, longitude: lng)
                let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
                mapView.setRegion(region, animated: true)
            }
        }
    }
    
    @IBAction func homeButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
