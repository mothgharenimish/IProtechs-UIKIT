//
//  OrderTableViewCell.swift
//  IProtechs-UIKIT
//
//  Created by Nimish Mothghare on 30/04/25.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    //MARK: -IBOutlet 
    @IBOutlet weak var customerImg: UIImageView!
    @IBOutlet weak var customernameLbl: UILabel!
    @IBOutlet weak var orderdateLbl: UILabel!
    @IBOutlet weak var orderidLbl: UILabel!
    @IBOutlet weak var contactnoLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var ordertotalLBl: UILabel!
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.customerImg.setCornerRadiusImage(10.0)
        self.orderView.setCornerRadiusView(10.0)
        self.deleteView.setCornerRadiusView(10.0)
        self.editView.setCornerRadiusView(10.0)
        self.idView.setCornerRadiusView(10.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
