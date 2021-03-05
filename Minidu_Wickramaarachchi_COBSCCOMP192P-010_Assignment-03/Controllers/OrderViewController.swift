//
//  OrderViewController.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-04.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class OrderViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    @IBOutlet weak var OrderTableView: UITableView!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        OrderTableView.dataSource = self
        OrderTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    let lblOrder  = [("Order 01"),("Order 02"),("Order 03"),]
    let lblTimeLeft = [("15min Left"),("20min Left"),("25min Left")]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lblOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Orders = OrderTableView.dequeueReusableCell(withIdentifier: "OrderItems", for: indexPath) as! OrdersTableViewCell
        Orders.lblOrderId.text = self.lblOrder[indexPath.row]
        Orders.lblTimeLeft.text = self.lblTimeLeft[indexPath.row]
        return Orders
    }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
