//
//  ViewController.swift
//  Location Demo
//
//  Created by Samuel Lichlyter on 11/4/17.
//  Copyright © 2017 Samuel Lichlyter. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        locationManager.startUpdatingLocation()
    }
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.allowsBackgroundLocationUpdates = true
        return manager
    }()
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let mostRecentLocation = locations.last else { return }
        
        if UIApplication.shared.applicationState == .active {
            print("App is in foreground; New Location: \(mostRecentLocation)")
        } else {
            print("App is in background; New Location: \(mostRecentLocation)")
        }
    }
}
