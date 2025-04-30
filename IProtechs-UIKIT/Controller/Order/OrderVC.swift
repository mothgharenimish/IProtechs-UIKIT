//
//  OrderVC.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 30/04/25.
//

import UIKit

class OrderVC: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var neworderBtn: UIButton!
    @IBOutlet weak var ordertblView: UITableView!
    
    
    //Order Array
    let orders : [OrderData] = []
    
    //MARK: -View Life Cycle 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ordertblView.delegate = self
        self.ordertblView.dataSource = self
        
    }
    
    //MARK: -NewOrder IBAction 
    @IBAction func neworderAction(_ sender: UIButton) {
        
        let neworderViewController = self.storyboard!.instantiateViewController(withIdentifier: "NewOrderVC") as! NewOrderVC
        self.navigationController!.pushViewController(neworderViewController, animated: true)
    }
    
    
    
}

//MARK: -UITableViewDelegate
extension OrderVC : UITableViewDelegate {
    
    
}

//MARK: -UITableViewDataSource
extension OrderVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ordertblView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        
        
        return cell
    }
    
    
    
}






