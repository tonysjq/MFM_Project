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

    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var distanceLbl: UILabel!
    let regionRadius:CLLocationDistance=2000
    
    let locationManager=CLLocationManager()
    
    var market:Market!
    var myPlaceMark:CLPlacemark?
    
   // let address=["Union Lawn, Parkville VIC 3052, Australia"]
    
//    var userlocation:CLLocation!
     var destinationLoc:CLLocation!
    override func viewDidLoad() {
        desc.text=market.marketDecs
        super.viewDidLoad()
        addressLbl.text=market.marketlocation
        map.delegate=self
       
            getPlacemarkFromAddress(market.marketlocation)
        
        
        
    }
   
    override func viewDidAppear(animated: Bool) {
        locationAuthStatus()
        
    }
    
    
    @IBAction func OnaddressPressed(sender: AnyObject) {
        var stringarray=market.marketlocation.componentsSeparatedByString(" ")
        
        var before="comgooglemaps://?saddr=Current+Location&daddr=\(stringarray[0])"
        for var i=1;i<stringarray.count;i=i+1{
            before=before+"+\(stringarray[i])"
        }
        before=before+"&directionsmode=transit"
       
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string:"comgooglemaps://")!)) {
            
            UIApplication.sharedApplication().openURL(NSURL(string:
                before)!)
        } else {
            if let addressDict = myPlaceMark?.addressDictionary as? [String:AnyObject], coordinate = myPlaceMark?.location!.coordinate {
                let mkPlacemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
                let mapItem = MKMapItem(placemark: mkPlacemark)
                let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                mapItem.openInMapsWithLaunchOptions(launchOptions)
            }
            
        }
        
    }
  

    @IBAction func FbbtnPressed(sender: AnyObject) {
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string:"fb://profile/")!)) {
            
            UIApplication.sharedApplication().openURL(NSURL(string:
                "fb://profile/1541232879529140")!)
        }
        else
        {
            UIApplication.sharedApplication().openURL(NSURL(string:
                "https://www.facebook.com/Carlton-Farmers-Market-1541232879529140/")!)
        }
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
                    self.myPlaceMark=marks[0]
                    self.destinationLoc=loc
                    self.createAnnotationForLocation(loc)
                    self.centrMapOnLocation(loc)
            }
        }
    
    }
    
        
    }
}