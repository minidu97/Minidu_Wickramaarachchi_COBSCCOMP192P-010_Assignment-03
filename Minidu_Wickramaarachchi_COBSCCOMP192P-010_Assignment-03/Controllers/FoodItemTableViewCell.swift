//
//  FoodItemTableViewCell.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-04.
//

import UIKit

class FoodItemTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var FoodDiscription: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var Percentage: UILabel!
    @IBOutlet weak var FoodName2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
