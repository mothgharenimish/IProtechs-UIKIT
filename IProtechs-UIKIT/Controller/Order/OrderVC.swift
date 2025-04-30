//
//  OrderVC.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 30/04/25.
//

import UIKit

class OrderVC: UIViewController, OrderDelegate {
    
    //MARK: -IBOutlet
    @IBOutlet weak var neworderBtn: UIButton!
    @IBOutlet weak var ordertblView: UITableView!
    
    
    //Order Array
    var orders : [OrderData] = []
    
    //MARK: -View Life Cycle 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ordertblView.delegate = self
        self.ordertblView.dataSource = self
        
        fetchOrders()


        
        ordertblView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        
        
        fetchOrders()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchOrders()
    }

    
    
    
    func fetchOrders() {
           orders = OrderCoreDataManager.shared.fetchOrders()
           self.ordertblView.reloadData()
       }
    
    
    func didAddOrder(_ order: OrderData) {
        
//        OrderCoreDataManager.shared.addOrder(order: order)
        fetchOrders()

    }
    
    //MARK: -NewOrder IBAction 
    @IBAction func neworderAction(_ sender: UIButton) {
        
        let neworderViewController = self.storyboard!.instantiateViewController(withIdentifier: "NewOrderVC") as! NewOrderVC
        neworderViewController.delegate = self
        self.navigationController!.pushViewController(neworderViewController, animated: true)
    }
    
    
    @objc func deletedtapped(sender : UIButton) {
        
        let order = orders[sender.tag]
        print("The sender tag we have to print \(sender.tag)")
        print("Print the delete Index \(order)")
        OrderCoreDataManager.shared.deleteOrder(orderID: order.orderid)
        fetchOrders()
      
    }
    
    @objc func edittapped(sender : UIButton) {
        
        let order = orders[sender.tag]
        let newOrderVC = self.storyboard!.instantiateViewController(withIdentifier: "NewOrderVC") as! NewOrderVC
        newOrderVC.delegate = self
        newOrderVC.isEditMode = true
        newOrderVC.orderToEdit = order
        self.navigationController!.pushViewController(newOrderVC, animated: true)
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
        
        
        cell.orderidLbl.text = orders[indexPath.row].orderid
        cell.customernameLbl.text = orders[indexPath.row].customername
        cell.orderdateLbl.text = "Order Due Date: " + orders[indexPath.row].orderduedate
        cell.addressLbl.text = orders[indexPath.row].customeraddress
        cell.contactnoLbl.text = orders[indexPath.row].customercontactno
        cell.ordertotalLBl.text = orders[indexPath.row].totalordervalue
        
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(deletedtapped), for: .touchUpInside)
        
        cell.editBtn.tag = indexPath.row
        cell.editBtn.addTarget(self, action: #selector(edittapped), for: .touchUpInside)
        return cell
    }
    
    
    
}






