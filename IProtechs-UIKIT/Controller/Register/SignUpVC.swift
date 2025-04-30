//
//  SignUpVC.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 29/04/25.
//

import UIKit

class SignUpVC: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var usernametxtField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordtxtField: UITextField!
    @IBOutlet weak var confirmpasswordView: UIView!
    @IBOutlet weak var confirmpasswordtxtField: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    
    let coreDataManager = CoreDataManager()
    
    
    //MARK: -View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        usernameView.setCornerRadiusView(9.0)
        usernameView.layer.borderWidth = 1.0
        usernameView.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordView.setCornerRadiusView(9.0)
        passwordView.layer.borderWidth = 1.0
        passwordView.layer.borderColor = UIColor.lightGray.cgColor
        
        confirmpasswordView.setCornerRadiusView(9.0)
        confirmpasswordView.layer.borderWidth = 1.0
        confirmpasswordView.layer.borderColor = UIColor.lightGray.cgColor
        
        
    }
    
    
    //MARK: -SignUp IbAction
    @IBAction func signupAction(_ sender: UIButton) {
        
        // Ensure the fields are not empty
               guard let username = usernametxtField.text, !username.isEmpty,
                     let password = passwordtxtField.text, !password.isEmpty,
                     let confirmPassword = confirmpasswordtxtField.text, !confirmPassword.isEmpty else {
                   // Show an alert if any field is empty
                   showAlert(message: "All fields are required.")
                   return
               }
               
               // Validate username using regex (no numbers)
               if !isValidUsername(username) {
                   showAlert(message: "Username should not contain any numbers.")
                   return
               }
               
               // Validate password strength using regex (10 characters, numerical or alphabetic or mixed)
               if !isValidPassword(password) {
                   showAlert(message: "Password must be 10 characters, and can be numeric, alphabetic, or a mix of both.")
                   return
               }
               
               // Ensure password and confirm password match
               if password != confirmPassword {
                   showAlert(message: "Passwords do not match.")
                   return
               }
               
               // Call CoreDataManager to save data
               coreDataManager.saveUserData(username: username, password: password, confirmPassword: confirmPassword) { (success, message) in
                   // Show an alert with the result of the save operation
                   self.showAlert(message: message)
               }
        
    }
    
    
    
    
    
}
