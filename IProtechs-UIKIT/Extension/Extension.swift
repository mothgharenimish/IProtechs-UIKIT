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


extension UIViewController {

    // Validate Username using Regex (No numbers)
       func isValidUsername(_ username: String) -> Bool {
           let usernameRegex = "^[a-zA-Z]+$"  // Only alphabetic characters (no numbers)
           let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
           return usernameTest.evaluate(with: username)
       }
       
       // Validate Password using Regex (10 characters, numeric or alphabetic or mixed)
       func isValidPassword(_ password: String) -> Bool {
           let passwordRegex = "^[a-zA-Z0-9]{10}$"  // 10 characters, can be alphabetic, numeric, or both
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
}
