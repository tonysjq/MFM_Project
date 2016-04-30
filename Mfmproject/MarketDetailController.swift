//
//  MarketDetailController.swift
//  Mfmproject
//
//  Created by Shuaiji Qian on 27/04/2016.
//  Copyright © 2016 Tony Qian. All rights reserved.
//

import Foundation
import UIKit
import MapKit
class MarketDetailController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    let regionRadius:CLLocationDistance=2000
    
    let locationManager=CLLocationManager()
    
    let address=["Union Lawn, Parkville VIC 3052, Australia"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate=self
        for add in address{
            getPlacemarkFromAddress(add)
        }
    }
   
    override func viewDidAppear(animated: Bool) {
        locationAuthStatus()
    }

    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse{
        map.showsUserLocation = true
        
        }else{
        
        locationManager.requestWhenInUseAuthorization()
        }
    
    }
    
    
    func createAnnotationForLocation(location:CLLocation){
    let market=MarketAnnotation(coordinate: location.coordinate)
        map.addAnnotation(market)
        
    }
    
    func centrMapOnLocation(location:CLLocation){
        let coordinateRegion=MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius*2, regionRadius*2)
        map.setRegion(coordinateRegion, animated: true)
        
    }
    
//    func mapView(mapview:MKMapView,didUpdateUserLocation userLocation:MKUserLocation){
//        if let loc=userLocation.location{
//            centrMapOnLocation(loc)
//        }
//    }
    
    
    func getPlacemarkFromAddress(address:String){
        CLGeocoder().geocodeAddressString(address) { (placemarks:[CLPlacemark]?, error:NSError?) in
            if let marks = placemarks where marks.count>0{
                if let loc=marks[0].location{
                    self.createAnnotationForLocation(loc)
                    self.centrMapOnLocation(loc)
            }
        }
    
    }
    
        
    }
}