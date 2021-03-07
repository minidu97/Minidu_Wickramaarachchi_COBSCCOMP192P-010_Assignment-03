//
//  UpdateDetailsViewController.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-06.
//

import UIKit
import FirebaseStorage

class UpdateDetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var txtUName: UITextField!
    @IBOutlet weak var txyCNum: UITextField!
    
    private let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL(string: urlString)else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.Image.image = image
            }
        })
        task.resume()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnEditClick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
            return
        }
        guard let imageData = image.pngData() else {
            return
        }
        storage.child("images/files.png").putData(imageData, metadata: nil, completion: { _, error in
            guard error == nil else {
                print("Faild to Upload")
                return
            }
            self.storage.child("images/files.png").downloadURL(completion: {url, error in
                guard let url = url, error == nil else{
                    return
                }
                let urlString = url.absoluteString
                DispatchQueue.main.async {
                    self.Image.image = image
                }
                print("URL: \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            })
            
        })
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func btnUpdateInfo(_ sender: Any) {
    }
    
    @IBAction func btnBack(_ sender: Any) {
        /*let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "TabBar" )
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
