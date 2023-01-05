//
//  UsersViewController.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation
import UIKit

class UsersViewController : UIViewController , Storyboard {
    
    weak var mainCoordinator : MainCoordinator?
    var usersViewModel = UsersViewModel()
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        
        self.navigationController?.isNavigationBarHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellConstants.user)

        usersViewModel.fetchUserDetailscompletion { [self] message in
            
            if message == APIConstant.apiMsgSuccess{
                DispatchQueue.main.async { [self] in
                    self.tableView.reloadData()
                }
            } else {
                showAlert(title: APIConstant.apiErrorTitle, message: message, okTitle: CTConstans.titleOK)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func loginButtonPressed() {
        self.mainCoordinator?.loginView()
    }
}


extension UsersViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.usersViewModel.usersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellConstants.user, for: indexPath)
        let user = self.usersViewModel.usersData[indexPath.row]
        cell.textLabel?.text = "\(user.username) : \(user.name)"
        return cell
    }
}

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let user = usersViewModel.usersData[indexPath.row]
        mainCoordinator?.showUsersDetailView(user: user)
        
    }
}
