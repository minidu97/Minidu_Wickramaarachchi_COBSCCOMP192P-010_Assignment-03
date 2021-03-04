//
//  LoginViewController.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-03.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func Login_Clicked(_ sender: Any) {
        validate()
    }
    
    @IBAction func SignUp_Clicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SIGNUP_VIEW" )
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    @IBAction func btnForgetPWClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ForgetPW" )
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func validate(){
        if email.text?.isEmpty == true{
            let alert = UIAlertController(title: "Error", message: "Please Check Your Email and Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if password.text?.isEmpty == true{
            let alert = UIAlertController(title: "Error", message: "Please Check Your Email and Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        Login()
    }
    func Login(){
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, error in
            guard let strongSelf = self else {return}
            if let error = error {
                print(error.localizedDescription)
            }
            self!.CheckUser()
        }
    }
    func CheckUser(){
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Allow_Location" )
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
    //override func viewDidAppear(_ animated: Bool) {
    //    validate()
    //}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
