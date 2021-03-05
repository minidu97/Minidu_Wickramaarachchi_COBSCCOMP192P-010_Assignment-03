//
//  SignUpViewController.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-03.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var phone_number: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confPW: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUp_Clicked(_ sender: Any) {
        if email.text?.isEmpty == true{
            let alert = UIAlertController(title: "Error", message: "Please Check Your Email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if phone_number.text?.isEmpty == true{
            let alert = UIAlertController(title: "Error", message: "Please Enter the Phone Number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if password.text?.isEmpty == true{
            let alert = UIAlertController(title: "Error", message: "Please Enter the Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        SignUp()
    }
    
    @IBAction func Cancel_Clicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "LOGIN_VIEW" )
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func SignUp(){
        if(password.text == confPW.text){
            Auth.auth().createUser(withEmail: email.text!,password: password.text!) { (authResult, error) in
                guard let user = authResult?.user,error == nil else{
                    print("Error \(error?.localizedDescription)")
                    return
                }
                var ref : DatabaseReference!
                ref = Database.database().reference()
                ref.child("users").child(user.uid).setValue(["email": self.email])
                ref.child("users").child(user.uid).setValue(["mobile": self.phone_number])
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "Allow_Location" )
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Password Didnt Match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
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

}
