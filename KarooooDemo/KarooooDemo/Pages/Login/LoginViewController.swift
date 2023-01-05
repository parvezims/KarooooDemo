//
//  LoginViewController.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import UIKit
import Combine

class LoginViewController: UIViewController, Storyboard {


    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var tfPassword: UITextField!
    @IBOutlet var tfCountry: UITextField!

    @IBOutlet var buttonLogin: UIButton!
    @IBOutlet var buttonSignup: UIButton!
    
    var isValidEmail : Bool = false
    var isValidPassword : Bool = false
    var isValidCountry: Bool = false

    var loginViewModel = LoginViewModel()
    weak var mainCoordinator: MainCoordinator?
    
    var subscriptions = Set<AnyCancellable>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(sender: UIButton) {
        
        if let username = tfEmail.text, let password = tfPassword.text, let country = tfCountry.text {
           
            
            if isValidEmail && isValidCountry && isValidPassword {
                
                let login = Login(username: username, password: password, country: country)
                
                if sender == buttonLogin {
                   
                    if loginViewModel.validateUserLogin(login: login) {
                        self.mainCoordinator?.showUsersView()
                    }
                    else {
                        showAlert(title: CTConstans.signinTitle, message: CTConstans.signinMessage, okTitle: CTConstans.titleOK)
                    }
                }
                else if sender == buttonSignup {
                    
                    if loginViewModel.signup(signup: login) {
                        
                        showAlert(title: CTConstans.signupTitle, message: CTConstans.signupSuccessMessage, okTitle: CTConstans.titleOK)
                    }
                }
            }
            else {
                
                tfEmail.shakeAnimation(status: isValidEmail)
                tfPassword.shakeAnimation(status: isValidPassword)
                tfCountry.shakeAnimation(status: isValidCountry)
            }
        }
    }
    
    
    @IBAction func selectCountryButtonPressed() {
        
        mainCoordinator?.presentCountryList(controller: self)
    }
    
    func configureViews(){
        
        tfEmail.showErrorData()
        tfCountry.showErrorData()
        tfPassword.showErrorData()
        
        buttonLogin.layer.cornerRadius = 5.0
        buttonLogin.layer.borderWidth = 1.5
        buttonLogin.layer.borderColor = UIColor(named:CTConstans.brandColor)?.cgColor
        
        
        tfEmail.textPublisher
            .sink(receiveValue: { [weak self] text in
                if let self = self {
                    if self.loginViewModel.checkForEmail(email: self.tfEmail.text) {
                        
                        self.tfEmail.showCompleteData()
                        self.isValidEmail = true
                    } else {
                        self.tfEmail.showErrorData()
                        self.isValidEmail = false

                    }
                }
            }).store(in: &subscriptions)
        
        
        tfPassword.textPublisher
            .sink(receiveValue: { [weak self] text in
                if let self = self {
                    if self.loginViewModel.checkForPassword(password: self.tfPassword.text) {
                        
                        self.tfPassword.showCompleteData()
                        self.isValidPassword = true
                    } else {
                        self.tfPassword.showErrorData()
                        self.isValidPassword = false

                    }
                }
            }).store(in: &subscriptions)
        
    }
    
    func setupFakeUsers() {
        
        tfEmail.text = CTConstans.fakeUserEmail
        tfPassword.text = CTConstans.fakeUserPassword
        tfCountry.text = CTConstans.fakeUserCountry
    }
}


extension LoginViewController : CountrySelection{
    
    func selectedCountry(country: Country) {
        tfCountry.text = country.name
        tfCountry.showCompleteData()
        isValidCountry = true
        print(country.name)
    }
}
