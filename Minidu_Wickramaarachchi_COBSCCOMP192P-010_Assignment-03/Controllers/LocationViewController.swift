//
//  LocationViewController.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-05.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate  {
    var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAllowLocationClick(_ sender: Any) {
        locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.requestAlwaysAuthorization()
            //view.backgroundColor = .gray
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "TabBar" )
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
               if CLLocationManager.isRangingAvailable() {
                    
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

}
}
