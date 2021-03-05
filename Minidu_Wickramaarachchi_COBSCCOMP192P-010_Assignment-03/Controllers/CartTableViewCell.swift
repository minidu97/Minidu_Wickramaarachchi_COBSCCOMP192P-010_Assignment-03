//
//  CartTableViewCell.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-04.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnReduce: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    var cur = 0;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func BtnAdd(_ sender: Any) {
        cur = Int(lblCount.text!)!;
        self.lblCount.text = String(cur + 1);
    }
    @IBAction func BtnMinus(_ sender: Any) {
        cur = Int(lblCount.text!)!;
        self.lblCount.text = String(cur - 1);
    }
    

}
