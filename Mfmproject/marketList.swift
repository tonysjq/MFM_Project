//
//  marketList.swift
//  Mfmproject
//
//  Created by JiangLewei on 29/04/2016.
//  Copyright © 2016 Tony Qian. All rights reserved.
//

import UIKit
import MapKit

class marketList: UIViewController, UITableViewDelegate, UITableViewDataSource,MKMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var sideMenu: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var marketlist:[Market]!
    //    let address=["Union Lawn, Parkville VIC 3052, Australia"]
    //
    //    var userLocation:CLLocation!
    let locationManager=CLLocationManager()
    //    var destinationLoc:CLLocation!
    //    locationManager.location
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        marketlist=createObject()
        self.tableView.backgroundColor = UIColor.clearColor()
        
        self.tableView.backgroundView?.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.tableView.separatorColor = UIColor.clearColor()
        
        //change navigation bar style
        
        var nav = navigationController?.navigationBar
        
        nav?.tintColor = UIColor.init(colorLiteralRed: 255, green: 255, blue: 255, alpha: 1)
        
        nav?.barTintColor = UIColor.init(colorLiteralRed: 0.102, green: 0.255, blue: 0.178, alpha: 0.5)
        
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.init(colorLiteralRed: 255, green: 255, blue: 255, alpha: 1)]
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        if self.revealViewController() != nil {
            
            sideMenu.target = self.revealViewController()
            
            sideMenu.action = "revealToggle:"
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    //    override func viewDidAppear(animated: Bool) {
    //        locationAuthStatus()
    //
    //    }
    
    
    func createObject()->[Market]{
        var CarltonFM=Market(name:"Carlton Farmer Market",titleimage:
            UIImage(named: "CarltonFM_Address_Logo_Purple.jpg"),location: "Carlton Primary School, Palmerston St, Carlton VIC 3053")
        
        var UnimelbFM=Market(name:"The University Of Melbourne",titleimage:UIImage(named: "UNI-MELB-WHITE-FM-400x400_0_0_1.jpg"),location: "Union Lawn, Parkville VIC 3052, Australia")
        
        var CollingwoodFM=Market(name: "Collingwood Children's Farm", titleimage: UIImage(named: "CWFM-220x165px.jpg"),location: "18 St Heliers St, Abbotsford, VIC, 3067, Australia")
        
        var CoburgNorthFM=Market(name: "Coburg North Primary School", titleimage: UIImage(named: "CFM-220x165px.jpg"),location: "Coburg North Primary School, 180 O’Hea Street, Coburg")
        
        var GasworksFM=Market(name: "Gasworks Arts Park", titleimage: UIImage(named: "GFM-220x165.jpg"),location: "Gasworks Arts Park, 21 Graham Street Albert Park VIC 3206")
        
        var FairfieldFM=Market(name: "Fairfield Primary School", titleimage: UIImage(named: "FFM-220x165px.jpg"),location: "Fairfield Primary School, Wingrove Street, Fairfield VIC 3078")
        
        var SlowfoodFM=Market(name:"Slow Food Melbourne",titleimage:UIImage(named: "SFMFM_220x165.jpg"),location: "Slow Food Victoria,‎ 1 St Heliers Street, Abbotsford VIC 3067")
        
        var EastlandFM=Market(name: "Eastland", titleimage: UIImage(named: "Eastland-220x165.jpg"),location: "Melbourne St, Ringwood, VIC 3134")
        
        
        var markets = [CarltonFM,UnimelbFM,CollingwoodFM,CoburgNorthFM,GasworksFM,FairfieldFM,SlowfoodFM,EastlandFM]
        return markets
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = marketlist.count * 2
        
        return count
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
            
            
            
            cell.marketImage.image = marketlist[indexPath.row/2].markettitleimage
            
            cell.marketName.text = marketlist[indexPath.row/2].name
            
            
            return cell} else {
            
            let cell = self.tableView.dequeueReusableCellWithIdentifier("spaceCell", forIndexPath: indexPath) as! SpaceCell
            
            
            return cell
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailview") as! MarketDetailController
        
        secondViewController.address=[marketlist[row/2].marketlocation]
        
        self.navigationController!.pushViewController(secondViewController, animated: true)
        
    }
    
    
    
    //    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        userLocation=manager.location
    //        print(userLocation)
    //    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            
            return 80
        }else {
            
            return 20
        }
    }
    
    
    
    
    
    //
    //    func locationAuthStatus(){
    //        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse{
    //
    //            locationManager.delegate = self
    //            locationManager.desiredAccuracy = kCLLocationAccuracyBest
    //
    //        }else{
    //
    //            locationManager.requestWhenInUseAuthorization()
    //        }
    //
    //    }
    
    
    
    //    func getPlacemarkFromAddress(address:String){
    //        CLGeocoder().geocodeAddressString(address) { (placemarks:[CLPlacemark]?, error:NSError?) in
    //            if let marks = placemarks where marks.count>0{
    //                if let loc=marks[0].location{
    //                    self.destinationLoc=loc
    //                }
    //            }
    //
    //        }
    //
    //
    //    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
