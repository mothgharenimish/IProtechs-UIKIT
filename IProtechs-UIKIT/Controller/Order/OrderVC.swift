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
    
    //MARK: -View Life Cycle 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ordertblView.delegate = self
        self.ordertblView.dataSource = self
        
    }
}


extension OrderVC : UITableViewDelegate {
    
    
}

extension OrderVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}






