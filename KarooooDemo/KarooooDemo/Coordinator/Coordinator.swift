//
//  Coordinator.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation
import UIKit


protocol Coordinator {
    
    var childCoordinator : [Coordinator] {get set}
    var navController: UINavigationController {get set}
    func loginView()
    
}


