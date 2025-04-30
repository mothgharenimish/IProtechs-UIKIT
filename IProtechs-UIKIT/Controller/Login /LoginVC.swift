//
//  LoginVC.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 29/04/25.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var usernametxtField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordtxtField: UITextField!
    @IBOutlet weak var signinBtn: UIButton!
    
    
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
    }
    
    
    //MARK: -SignIn IbAction
    @IBAction func signinAction(_ sender: UIButton) {
        
        // Ensure the fields are not empty
               guard let username = usernametxtField.text, !username.isEmpty,
                     let password = passwordtxtField.text, !password.isEmpty else {
                   // Show an alert if any field is empty
                   showAlert(message: "Both fields are required.")
                   return
               }
               
               // Call CoreDataManager to fetch user by username and password
               if let user = coreDataManager.fetchUserByUsernameAndPassword(username: username, password: password) {
                   // If user is found, login successful
//                   showAlert(message: "Login successful!")
                   shownaviagtionAlert(title: "Login", message: "Login Successfull", completion: {
                       
                       let loginViewController = self.storyboard!.instantiateViewController(withIdentifier: "OrderVC") as! OrderVC
                       self.navigationController!.pushViewController(loginViewController, animated: true)
                   })
                   print("User logged in: \(user.username ?? "")")
               } else {
                   // If no user is found, login failed
                   showAlert(message: "Invalid username or password.")
               }
        
    }
    
    
    //MARK: -Show Alert
        func showLoginAlert(message: String) {
            let alertController = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
    
    

}
