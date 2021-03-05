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
public struct Order: Codable {
    let id :String?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
    }
}

class OrderViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let db = Firestore.firestore()
    var orders = [Order]()

    @IBOutlet weak var OrderTableView: UITableView!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        OrderTableView.dataSource = self
        OrderTableView.delegate = self
        OrderDetails()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == OrderTableView)
              {
                  let cartCell = OrderTableView.dequeueReusableCell(withIdentifier: "OrderItems", for: indexPath) as! OrdersTableViewCell
                  cartCell.lblOrderId.text = orders[indexPath.row].id
                  cartCell.lblTimeLeft.text  = orders[indexPath.row].status
                  return cartCell;
              }
              else
              {
                  return UITableViewCell()
              }
    }
        
    
func OrderDetails(){
    print("call")
    db.collection("Orders").document("0716950344").collection("Order").addSnapshotListener { (snapshot, err) in
            if err != nil {
                print(err?.localizedDescription ?? nil)
            }else{
                if snapshot?.isEmpty != true {
                    self.orders.removeAll()
                    for document in snapshot!.documents{
                        
                        let documentID = document.documentID
                        let status     = document.get("status")
                        let newTask = Order(id: documentID as? String, status: status as? String)
                            self.orders.append(newTask)
                        }
                }
                self.OrderTableView.reloadData()
            }
        }
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
