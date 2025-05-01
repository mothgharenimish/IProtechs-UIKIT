//
//  Extension.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 29/04/25.
//

import Foundation
import UIKit


extension UIButton {
    
    
    func setCornerRadiusBtn(_ radius: CGFloat) {
           self.layer.cornerRadius = radius
       }
    
}


extension UIView {
    
    func setCornerRadiusView(_ radius: CGFloat) {
           self.layer.cornerRadius = radius
       }
    
}

extension UIImageView {
    
    func setCornerRadiusImage(_ radius: CGFloat) {
           self.layer.cornerRadius = radius
       }
    
}


extension UIViewController {

       func isValidUsername(_ username: String) -> Bool {
           let usernameRegex = "^[a-zA-Z]+$"
           let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
           return usernameTest.evaluate(with: username)
       }
       
       func isValidPassword(_ password: String) -> Bool {
           let passwordRegex = "^[a-zA-Z0-9]{10}$"
           let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
           return passwordTest.evaluate(with: password)
       }
    
    //MARK: -Show Alert
       func showAlert(message: String) {
           let alertController = UIAlertController(title: "Sign Up", message: message, preferredStyle: .alert)
           let action = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(action)
           self.present(alertController, animated: true, completion: nil)
       }
    
    
    func shownaviagtionAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion?()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func Passwordshow(psdtextfiled : UITextField,eyeimg : UIImageView,iconclick : inout Bool) {
        
        if iconclick {
            
            psdtextfiled.isSecureTextEntry = false
            eyeimg.image = UIImage(named: "icons8-eye-24 (1)")
        }
        
        else {
            
            psdtextfiled.isSecureTextEntry = true
            eyeimg.image = UIImage(named: "icons8-invisible-32 (2)")
        }
        
        iconclick = !iconclick
    }
    
    
    func passwordRemember(boxImg : UIImageView,boxClick : inout Bool) {
        
        if boxClick {
            
            boxImg.image = UIImage(named: "icons8-checked-checkbox-50")
        }
        
        else {
            
            boxImg.image = UIImage(named: "icons8-unchecked-checkbox-24")
        }
        
        boxClick = !boxClick
    }
    
    
}
