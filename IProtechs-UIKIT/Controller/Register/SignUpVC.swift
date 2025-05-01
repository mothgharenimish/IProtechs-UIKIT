//
//  SignUpVC.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 29/04/25.
//

import UIKit
import IQKeyboardManagerSwift

class SignUpVC: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var usernametxtField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordtxtField: UITextField!
    @IBOutlet weak var confirmpasswordView: UIView!
    @IBOutlet weak var confirmpasswordtxtField: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var fbView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var passwordeyeimg: UIImageView!
    @IBOutlet weak var confirmpasswordimg: UIImageView!
    
    let coreDataManager = CoreDataManager()
    
    var iconClick = false

    
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
        
        googleView.setCornerRadiusView(9.0)
        googleView.layer.borderWidth = 1.0
        googleView.layer.borderColor = UIColor.lightGray.cgColor
        
        fbView.setCornerRadiusView(9.0)
        fbView.layer.borderWidth = 1.0
        fbView.layer.borderColor = UIColor.lightGray.cgColor
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordimageTapped(tapGestureRecognizer:)))
        passwordeyeimg.isUserInteractionEnabled = true
        passwordeyeimg.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizers = UITapGestureRecognizer(target: self, action: #selector(confirmpasswordimageTapped(tapGestureRecognizer:)))
        confirmpasswordimg.isUserInteractionEnabled = true
        confirmpasswordimg.addGestureRecognizer(tapGestureRecognizers)
    }
    
    
    @objc func passwordimageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImages = tapGestureRecognizer.view as! UIImageView
        
        print("Tapped on the Eye Image")
        
        Passwordshow(psdtextfiled: passwordtxtField, eyeimg: tappedImages, iconclick: &iconClick)
    }
    
    @objc func confirmpasswordimageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        print("Tapped on the Eye Image")
        
        Passwordshow(psdtextfiled: confirmpasswordtxtField, eyeimg: tappedImage, iconclick: &iconClick)
    }
   
    
    //MARK: -Back IBAction
    @IBAction func backAction(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    
    //MARK: -Sign In IBAction 
    @IBAction func signinAction(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    
    
    
    //MARK: -SignUp IbAction
    @IBAction func signupAction(_ sender: UIButton) {
        
               guard let username = usernametxtField.text, !username.isEmpty,
                     let password = passwordtxtField.text, !password.isEmpty,
                     let confirmPassword = confirmpasswordtxtField.text, !confirmPassword.isEmpty else {
                   showAlert(message: "All fields are required.")
                   return
               }
               
               if !isValidUsername(username) {
                   showAlert(message: "Username should not contain any numbers.")
                   return
               }
               
              
               if !isValidPassword(password) {
                   showAlert(message: "Password must be 10 characters, and can be numeric, alphabetic, or a mix of both.")
                   return
               }
               
               if password != confirmPassword {
                   showAlert(message: "Passwords do not match.")
                   return
               }
               
               coreDataManager.saveUserData(username: username, password: password, confirmPassword: confirmPassword) { (success, message) in
                  
                   self.shownaviagtionAlert(title: "SignUp", message: "SignUp Successfully", completion: {
                       
                       self.navigationController?.popViewController(animated: true)

                       
                   })
                   
               }
        
    }
    
    
    
    
    
}
