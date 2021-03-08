//
//  DetailViewController.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-06.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    

    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var ItemTableView: UITableView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var contactnumber: UILabel!
    let image1 = "https://firebasestorage.googleapis.com/v0/b/nibmcafateria.appspot.com/o/images%2Ffiles.png?alt=media&token=0bb9e078-bdde-41fb-adff-bb4e31b13816"
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemTableView.dataSource = self
        ItemTableView.delegate = self
        Image.load(urlString: image1)
        self.contactnumber.text = "0716950344"
        self.username.text = "trendymaxxx@gmail.com"


        // Do any additional setup after loading the view.
    }
    
    
    let item11  = [("HotDog"),("HotDog Long"),("Pizza")]
    let item22 = [("HotDog"),("HotDog Long"),("Pizza")]
    let item11price = [(200),(300),(400)]
    let item22price = [(200),(300),(400)]
    let date1 = [(2021-01-01),(2021-01-05),(2021-01-08)]
    let price1 = [(900),(900),(900)]
    
    
    @IBAction func btnUpdateInfoClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "UpdateAccount" )
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item11.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let items = ItemTableView.dequeueReusableCell(withIdentifier: "orderItems", for: indexPath) as! AccItemTableViewCell
            items.item1.text = self.item11[indexPath.row]
            items.item2.text = self.item22[indexPath.row]
            items.item1price.text = "Rs. " + String(self.item11price[indexPath.row])
            items.item1price.text = "Rs. " + String(self.item22price[indexPath.row])
            items.date.text = String(self.date1[indexPath.row])
            items.price.text = String(self.price1[indexPath.row])
            return items
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
