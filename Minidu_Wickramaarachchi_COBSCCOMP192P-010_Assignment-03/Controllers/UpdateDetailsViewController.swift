//
//  UpdateDetailsViewController.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-06.
//

import UIKit

class UpdateDetailsViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var txtUName: UITextField!
    @IBOutlet weak var txyCNum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnEditClick(_ sender: Any) {
        
    }
    
    @IBAction func btnUpdateInfo(_ sender: Any) {
    }
    
    @IBAction func btnBack(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AccountDetails" )
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
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
