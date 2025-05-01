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
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var fbView: UIView!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var eyeimg: UIImageView!
    @IBOutlet weak var remembermeImg: UIImageView!
    @IBOutlet weak var remembermeLbl: UILabel!
    
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
        
        googleView.setCornerRadiusView(9.0)
        googleView.layer.borderWidth = 1.0
        googleView.layer.borderColor = UIColor.lightGray.cgColor
        
        fbView.setCornerRadiusView(9.0)
        fbView.layer.borderWidth = 1.0
        fbView.layer.borderColor = UIColor.lightGray.cgColor
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        eyeimg.isUserInteractionEnabled = true
        eyeimg.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizerLbl = UITapGestureRecognizer(target: self, action: #selector(imageTappedLbl(tapGestureRecognizer:)))
        remembermeLbl.isUserInteractionEnabled = true
        remembermeLbl.addGestureRecognizer(tapGestureRecognizerLbl)
    }
    
    
    @objc func imageTappedLbl(tapGestureRecognizer: UITapGestureRecognizer) {
        
        passwordRemember(boxImg: remembermeImg, boxClick: &iconClick)

        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        print("Tapped on the Eye Image")
        
        Passwordshow(psdtextfiled: passwordtxtField, eyeimg: tappedImage, iconclick: &iconClick)
    }
    
    
    
    //MARK: -Sign Up IBAction
    @IBAction func signupAction(_ sender: UIButton) {
        
        let signupViewController = self.storyboard!.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController!.pushViewController(signupViewController, animated: true)
    }
    
    
    //MARK: -Back IBAction
    @IBAction func backAction(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    
    //MARK: -SignIn IbAction
    @IBAction func signinAction(_ sender: UIButton) {
        
               guard let username = usernametxtField.text, !username.isEmpty,
                     let password = passwordtxtField.text, !password.isEmpty else {
                   showAlert(message: "Both fields are required.")
                   return
               }
               
               if let user = coreDataManager.fetchUserByUsernameAndPassword(username: username, password: password) {
                 
                   shownaviagtionAlert(title: "Login", message: "Login Successfull", completion: {
                       
                       let loginViewController = self.storyboard!.instantiateViewController(withIdentifier: "OrderVC") as! OrderVC
                       self.navigationController!.pushViewController(loginViewController, animated: true)
                   })
                   print("User logged in: \(user.username ?? "")")
               } else {
                   shownaviagtionAlert(title: "Login", message: "Invalid username or password.")
               }
        
    }
    
}
