//
//  DetailViewController.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-06.
//

import UIKit

class DetailViewController: UIViewController {    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var ItemTableView: UITableView!
    let image1 = "https://firebasestorage.googleapis.com/v0/b/nibmcafateria.appspot.com/o/images%2Ffiles.png?alt=media&token=0bb9e078-bdde-41fb-adff-bb4e31b13816"
    override func viewDidLoad() {
        super.viewDidLoad()
        Image.load(urlString: image1)


        // Do any additional setup after loading the view.
    }
    @IBAction func btnUpdateInfoClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "UpdateAccount" )
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
extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
