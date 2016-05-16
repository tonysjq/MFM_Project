//
//  ViewController.swift
//  Mfmproject
//
//  Created by Tony Qian on 25/04/2016.
//  Copyright © 2016 Tony Qian. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.locationManager.stopUpdatingLocation()
        
        let latestLocation = locations.last
        
        let latitude = latestLocation!.coordinate.latitude
        let longitude = latestLocation!.coordinate.longitude
        
        
         DataContainerSingleton.sharedDataContainer.latitude=latitude
         DataContainerSingleton.sharedDataContainer.longitude=longitude
    }
    
    @IBAction func OnMarketPressed(sender: AnyObject) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

