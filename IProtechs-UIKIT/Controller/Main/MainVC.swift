//
//  MainVC.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 29/04/25.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var alreadyBtn: UIButton!
    
    //MARK: -View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        signupBtn.setCornerRadiusBtn(9.0)
        alreadyBtn.setCornerRadiusBtn(9.0)
        alreadyBtn.layer.borderWidth = 2.0
        alreadyBtn.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    //MARK: -SignUP IBAction
    @IBAction func signupAction(_ sender: UIButton) {
        
        
    }
    
    
    //MARK: -Already Account IBAction 
    @IBAction func alreadyaccountAction(_ sender: UIButton) {
        
        
    }
}
