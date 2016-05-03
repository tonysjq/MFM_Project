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

class MarketDetailController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate{

    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var distanceLbl: UILabel!
    let regionRadius:CLLocationDistance=2000
    
    let locationManager=CLLocationManager()
    
    var address=[String]()
   // let address=["Union Lawn, Parkville VIC 3052, Australia"]
    
//    var userlocation:CLLocation!
     var destinationLoc:CLLocation!
    override func viewDidLoad() {
        super.viewDidLoad()
        addressLbl.text=address[0]
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
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
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
        map.setRegion(coordinateRegion, animated: false)
        
    }
    
    func mapView(mapview:MKMapView,didUpdateUserLocation userLocation:MKUserLocation){
        if let loc=userLocation.location{
            let nf = NSNumberFormatter()
            nf.numberStyle = NSNumberFormatterStyle.DecimalStyle
            nf.maximumFractionDigits = 2
            destinationLoc.distanceFromLocation(loc)
            var distance=(destinationLoc.distanceFromLocation(loc))/1000
            nf.stringFromNumber(distance)
            distanceLbl.text="\(nf.stringFromNumber(distance)!) km"
            
        }
    }
    
    
    func getPlacemarkFromAddress(address:String){
        CLGeocoder().geocodeAddressString(address) { (placemarks:[CLPlacemark]?, error:NSError?) in
            if let marks = placemarks where marks.count>0{
                if let loc=marks[0].location{
                    self.destinationLoc=loc
                    self.createAnnotationForLocation(loc)
                    self.centrMapOnLocation(loc)
            }
        }
    
    }
    
        
    }
}