//
//  NewOrderVC.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 30/04/25.
//

import UIKit

class NewOrderVC: UIViewController {
    
    //MARK: -IBAction
    @IBOutlet weak var orderidView: UIView!
    @IBOutlet weak var orderidtxtField: UITextField!
    @IBOutlet weak var orderdateView: UIView!
    @IBOutlet weak var orderdatetxtField: UITextField!
    @IBOutlet weak var customernameView: UIView!
    @IBOutlet weak var customernametxtField: UITextField!
    @IBOutlet weak var customeraddressView: UIView!
    @IBOutlet weak var customeraddresstxtField: UITextField!
    @IBOutlet weak var customercontactView: UIView!
    @IBOutlet weak var customertxtField: UITextField!
    @IBOutlet weak var ordertotalView: UIView!
    @IBOutlet weak var ordertotaltxtField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    //MARK: -View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderidView.setCornerRadiusView(9.0)
        orderidView.layer.borderWidth = 1.0
        orderidView.layer.borderColor = UIColor.lightGray.cgColor

        orderdateView.setCornerRadiusView(9.0)
        orderdateView.layer.borderWidth = 1.0
        orderdateView.layer.borderColor = UIColor.lightGray.cgColor
        
        customernameView.setCornerRadiusView(9.0)
        customernameView.layer.borderWidth = 1.0
        customernameView.layer.borderColor = UIColor.lightGray.cgColor
        
        customeraddressView.setCornerRadiusView(9.0)
        customeraddressView.layer.borderWidth = 1.0
        customeraddressView.layer.borderColor = UIColor.lightGray.cgColor
        
        customercontactView.setCornerRadiusView(9.0)
        customercontactView.layer.borderWidth = 1.0
        customercontactView.layer.borderColor = UIColor.lightGray.cgColor
        
        ordertotalView.setCornerRadiusView(9.0)
        ordertotalView.layer.borderWidth = 1.0
        ordertotalView.layer.borderColor = UIColor.lightGray.cgColor


      
    }
    
    //MARK: -Save IBAction
    @IBAction func saveAction(_ sender: UIButton) {
        
        
    }
    
   
}
