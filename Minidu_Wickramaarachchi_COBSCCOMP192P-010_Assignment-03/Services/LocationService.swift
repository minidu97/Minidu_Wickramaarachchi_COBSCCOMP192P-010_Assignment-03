//
//  LocationService.swift
//  Minidu_Wickramaarachchi_COBSCCOMP192P-010_Assignment-03
//
//  Created by Minidu Wickramaarachchi on 2021-03-03.
//

import Foundation
import CoreLocation

final class LocationService: NSObject{
    private let manager: CLLocationManager
    
    init(manager: CLLocationManager = .init()){
        self.manager = manager
        super.init()
        
        manager.delegate = self
    }
}

extension LocationService: CLLocationManagerDelegate{
    }


