//
//  NewOrderVC.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 30/04/25.
//

import UIKit
import IQKeyboardManagerSwift


protocol OrderDelegate: AnyObject {
    func didAddOrder(_ order: OrderData)
}

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
    @IBOutlet weak var customernumbertxtField: UITextField!
    @IBOutlet weak var ordertotalView: UIView!
    @IBOutlet weak var ordertotaltxtField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    
    weak var delegate: OrderDelegate?
    
    
    var datePicker: UIDatePicker?
    
    
        var isEditMode = false
        var orderToEdit: OrderData?


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


               datePicker = UIDatePicker()
               datePicker?.datePickerMode = .date
               datePicker?.addTarget(self, action: #selector(dateChanged), for: .valueChanged)

               let toolBar = UIToolbar()
               toolBar.sizeToFit()
               let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
               toolBar.setItems([doneButton], animated: true)

               orderdatetxtField.inputView = datePicker
               orderdatetxtField.inputAccessoryView = toolBar
        
        
        
                if isEditMode, let order = orderToEdit {
                    orderidtxtField.text = order.orderid
                    orderdatetxtField.text = order.orderduedate
                    customernametxtField.text = order.customername
                    customeraddresstxtField.text = order.customeraddress
                    customernumbertxtField.text = order.customercontactno
                    ordertotaltxtField.text = order.totalordervalue
                    
                    orderidtxtField.isEnabled = false
                    title = "Edit Order"
                } else {
                    title = "New Order"
                }
      
    }
    
    
    
    @IBAction func backAction(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    
    // MARK: - Date Picker Methods
        @objc func dateChanged() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            orderdatetxtField.text = dateFormatter.string(from: datePicker!.date)
        }

        // MARK: - Done Button Action
        @objc func doneButtonTapped() {
            self.view.endEditing(true)
        }
    
    //MARK: -Date Picker IBAction 
    @IBAction func datepickerOpen(_ sender: UIButton) {
        
        orderdatetxtField.becomeFirstResponder()

    }
    
    
    //MARK: -Save IBAction
    @IBAction func saveAction(_ sender: UIButton) {
        
        if let orderID = orderidtxtField.text, !orderID.isEmpty,
               let orderdate = orderdatetxtField.text, !orderdate.isEmpty,
               let customername = customernametxtField.text, !customername.isEmpty,
               let customeraddress = customeraddresstxtField.text, !customeraddress.isEmpty,
               let customernumber = customernumbertxtField.text, !customername.isEmpty,
               let ordertotalvalue = ordertotaltxtField.text, !ordertotalvalue.isEmpty {
                
                let newOrder = OrderData(orderid: orderID, orderduedate: orderdate, customername: customername, customeraddress: customeraddress, customercontactno: customernumber, totalordervalue: ordertotalvalue)
                
            if isEditMode {
                       OrderCoreDataManager.shared.updateOrder(order: newOrder)
                   } else {
                       OrderCoreDataManager.shared.addOrder(order: newOrder)
                   }
                   
                   delegate?.didAddOrder(newOrder)
                self.navigationController?.popViewController(animated: true)
            } else {
                shownaviagtionAlert(title: "New Order", message: "Please fill all the required fields")
            }

    }
    
   
}
