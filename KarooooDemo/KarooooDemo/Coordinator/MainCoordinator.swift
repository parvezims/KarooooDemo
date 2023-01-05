//
//  MainCoordinator.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation
import UIKit

class MainCoordinator : Coordinator {    
    
    var childCoordinator: [Coordinator] = [Coordinator]()
    var navController: UINavigationController
    
    init (navController: UINavigationController) {
        self.navController = navController
    }
    
    func loginView() {
        
        let login = LoginViewController.instantiate()
        login.mainCoordinator = self
        self.navController.pushViewController(login, animated: false)
    }
    
    func showUsersView() {
        let usersView = UsersViewController.instantiate()
        usersView.mainCoordinator = self
        self.navController.pushViewController(usersView, animated: false)
    }
    
    func showUsersDetailView(user: User) {
        let usersView = UserDetailsViewController.instantiate()
        usersView.mainCoordinator = self
        usersView.setUser(user: user)
        self.navController.pushViewController(usersView, animated: false)
    }
    
    func presentCountryList(controller: LoginViewController) {
        let countryView = CountryListViewController.instantiate()
        countryView.countryDelegate = controller
        self.navController.present(countryView, animated: true)
    }
}
