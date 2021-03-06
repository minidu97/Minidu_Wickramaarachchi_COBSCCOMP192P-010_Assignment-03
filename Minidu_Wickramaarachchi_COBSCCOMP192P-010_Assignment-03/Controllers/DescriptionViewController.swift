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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnbackClick(_ sender: Any) {
        /*let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "FoodView" )
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)*/
        self.dismiss(animated: true)
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
