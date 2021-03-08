//
//  DescriptionViewController.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-05.
//

import UIKit

class DescriptionViewController: UIViewController {
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var FName: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var Offer: UILabel!
    @IBOutlet weak var AddtoCart: UIButton!
    @IBOutlet weak var Description: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ImageView.image = self.ImageView[indexPath.row]
        self.FName.text = "Hot Dog"
        self.Price.text = "Rs. 200"
        self.Offer.text = "10% OFF"
        self.Image.image = UIImage(named: "HotDog2")
        self.Description.text = "It is a universal fact that you can't enjoy your happy moments without good food, but is it worth spending all your time in the kitchen to prepare something good and miss all the fun! Well, we have a delicious fix for all your happy moments with friends and family. Chicken hot dog is perfect for such occasions. All you need is a few ingredients in place, just add in the ingredients and enjoy. Here's a simple recipe of chicken hot dog that you can make in just 10 minutes. So, without wasting any more time, just be a smart home chef and woo your loved ones with this awesome delight."


        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnbackClick(_ sender: Any) {
        /*let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "FoodView" )
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)*/
        self.dismiss(animated: true)
    }
    
    @IBAction func btnAddtoCart(_ sender: Any) {
        self.dismiss(animated: true)
        //FoodView
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
