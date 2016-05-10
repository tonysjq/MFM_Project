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
        let CarltonFM=Market(name:"Carlton Farmer Market",titleimage:
            UIImage(named: "CarltonFM_Address_Logo_Purple.jpg")!,location: "Carlton Primary School, Palmerston St, Carlton VIC 3053")
        
        CarltonFM.marketDecs = "Established in October 2014 with support from the City of Melbourne, the Carlton Farmers' Market is held in the grounds of Carlton Primary School. This inner-city accredited market operates with around 35 stall holders offering ethical, local food from meat, fruit and vegetables to nuts, eggs and cheese.There is plenty on offer for a hearty breakfast or an early lunch - and plenty of space to pull up a picnic rug.Entry to the market is by gold coin donation which supports the school's programs. Shoppers are invited to further support the Stephanie Alexander Kitchen Garden Program at Carlton Primary School through a \"Bumper Barrow\" with donations of seedlings and market produce.The market is plastic-bag free. Follow the MFM action via our twitter and facebook page!"
        
        let UnimelbFM=Market(name:"The University Of Melbourne",titleimage:UIImage(named: "UNI-MELB-WHITE-FM-400x400_0_0_1.jpg")!,location: "Union Lawn, Parkville VIC 3052, Australia")
        
        UnimelbFM.marketDecs = "Melbourne Farmers' Markets is thrilled to have their first mid week, weekly farmers' market at the University of Melbourne. The market is right in the heart of The University of Melbourne Parkville campus with the support of The University and Carlton Connect Initiative and is positioned on Union Lawn and South Court. It's central, shady and a wonderful space for the many students and staff to meet regional Victorian producers and shop direct. Enjoy the atmosphere of a summer picnic with the integrity of an accredited farmers market! To keep up to dates with market news and stall holder specials, be sure to follow our University of Melbourne Farmers' Market Facebook page and get involved with #UniMelbFM!"
        
        let CollingwoodFM=Market(name: "Collingwood Children's Farm", titleimage: UIImage(named: "CWFM-220x165px.jpg")!,location: "18 St Heliers St, Abbotsford, VIC, 3067, Australia")
        
        CollingwoodFM.marketDecs = "Nestled in a bend on the Yarra, the inner city farm is a Melbourne treasure, just 4kms from the CBD . Melbourne ’s first farmers’ market started here in October 2002 in part as a revenue and profile raiser for the imminent danger of losing the Farm to a housing development.\n Ten years on and the fight is won thanks to incredible community determination and significant support from market goers. The costs of maintaining the integrity of the area for the community are ongoing, and borne largely by the Farm in conjunction with its immediate neighbour in the precinct, the magnificent Abbotsford Convent. Public awareness and contribution to the financial struggle is still an urgent issue.\nWe are thrilled to have been voted Australia’s Outstanding Farmers’ Market at the 2010 delicious magazine national Produce Awards. “The Collingwood Children’s Farm farmers’ market is unquestionably one of the most popular in the country,” says Jane Adams of the Australian Farmers’ Market Association. Established in 2002, the community-owned market brings more than 50 Victorian producers to inner-city Melbourne on the second Saturday of each month, and was one of the first farmers’ markets to be accredited for authenticity in May this year.\n\nFollow the market on twitter and via the MFM Facebook page!"
        
        let CoburgNorthFM=Market(name: "Coburg North Primary School", titleimage: UIImage(named: "CFM-220x165px.jpg")!,location: "Coburg North Primary School, 180 O’Hea Street, Coburg")
        
        CoburgNorthFM.marketDecs="The Coburg Farmers' Market is held every Saturday from 8am-1pm in the grounds of the Coburg North Primary School. The market stalls merge around a big central playground which is great for kids and there is an undercover area as well as shaded outdoor seating.\n\nGet your fresh produce from farmers and growers who come from all regions across Victoria to attend this lovely market, which features live music entertainment and various popular breakfast stalls.\n\nThere is always a great supply of fresh vegetables, seasonal fruits, nuts & oils, meats, eggs, bread, cheeses, chickens and cakes, pies, sweets and treats and wine and cider. Too many to mention so come and try for yourself!\n\nCoburg Farmers' Market is plastic bag free so please bring your own bags.\n\nFollow the action on twitter and facebook!"
        let GasworksFM=Market(name: "Gasworks Arts Park", titleimage: UIImage(named: "GFM-220x165.jpg")!,location: "Gasworks Arts Park, 21 Graham Street Albert Park VIC 3206")
        
        GasworksFM.marketDecs="Gasworks Arts Park is a diverse arts precinct that is sited within the remaining walls of the South Melbourne gas production plant. The parklands are surrounded by artists' studios, theatres, galleries, cafe & workshops which are in constant use. The year-round program includes exhibitions, theatre, music, dance, circus and outdoor cinema. The park is owned by the City of Port Phillip and leased to Gasworks management; a not-for-profit arts organisation which produces the annual program of events and exhibitions.\n\nThe Gasworks Farmers' Market started in January 2006 and brings together local food producers to make a direct connection with the people who eat their food. We are proud to have been named the Most Outstanding Farmers' Market for 2012 in the delicious Produce Awards!\n\nFollow all the MFM action via our twitter and Facebook page!"
        
        let FairfieldFM=Market(name: "Fairfield Primary School", titleimage: UIImage(named: "FFM-220x165px.jpg")!,location: "Fairfield Primary School, Wingrove Street, Fairfield VIC 3078")
        
        FairfieldFM.marketDecs="Fairfield Farmers' Market proudly operates on the 3rd Saturdays of each month and the 5th Saturdays of the year at the Fairfield Primary School.\n\nStallholders include growers of free range pork, beef, lamb, goat chooks and eggs, fresh fruit and vegies, milk straight from the farm, handmade cheeses, honey, olive oil, nuts and seedlings. These stallholders are from near and far across Victoria; some you’ll know and others we’ll be introducing, having their first crack at this dynamic way to get their produce direct to their customers.\n\nFor the school this is an opportunity to \"support local farmers who are good enough to do all the hard work and then bring it to our door\", says Fairfield Primary School's council president Geoff Reany.\n\nCoffee, BBQ brekkie, pastries, fresh juices and lots more good things to enjoy complete the picture. A neighbourhood farmers' market creates a very different environment for household food shopping.\n\nFollow the action on twitter and via our MFM facebook page!"
        
        let SlowfoodFM=Market(name:"Slow Food Melbourne",titleimage:UIImage(named: "SFMFM_220x165.jpg")!,location: "Slow Food Victoria,‎ 1 St Heliers Street, Abbotsford VIC 3067")
        SlowfoodFM.marketDecs="Farmers’ markets are at the heart of Slow Food. It’s not just the most direct source of fresh produce but also a genuine, accessible way for the public to find the real story on how our food is farmed.\n\nSlow Food Melbourne invites you to its Farmer’s Market at the Abbotsford Convent on the fourth Saturday of each month. The market will illustrate Slow Food principles and the Victorian Farmers’ Market Association criteria and be all proceeds will be directed back into local Slow Food endorsed projects.\n\nThis is simply about Victorian farmers getting what they deserve for their efforts and consumers getting value for what they pay for…. no long cold storage, no gases, no over processed chemical laden foods and no GMO’s. Just delicious, nourishing seasonal foods in an atmosphere that promotes conviviality and community.\n\nCome and find seasonal, organic and low/no chemical fruit and vegetables, free range, rare breed and heritage meats, fish, chooks and eggs. Then there’s handmade cheeses, pasta, condiments, bread, honey, olive oil, flowers, seedlings and much, much more! You can be up with the birds or stroll down and brunch while you shop.\n\nFollow all the action on twitter and via the MFM Facebook page."
        
        let EastlandFM=Market(name: "Eastland", titleimage: UIImage(named: "Eastland-220x165.jpg")!,location: "Melbourne St, Ringwood, VIC 3134")
        EastlandFM.marketDecs="The Eastland Farmers' Market in Ringwood is run in partnership with Eastland. Held along Melbourne Street and Town Square, the market offers seasonal and organic fruit and vegetables, free range meats and eggs, honey, nuts, flowers and seedlings alongside a selection of artisanal products including cheeses, relishes, breads, jams and smallgoods.\n\nThe market has a primary focus on the Yarra Valley, showcasing the finest in regional produce. It is the first accredited farmers market in the region and is a place for the community to access fresh food direct from producers in the local area and enjoy regional Victoria right on their doorstep!\n\nKeep an eye out on this page for stall holder updates and on our Facebook, Twitter and Instagram for news as we get closer to our debut market on the 24th April 2016!"
        
        let markets = [CarltonFM,UnimelbFM,CollingwoodFM,CoburgNorthFM,GasworksFM,FairfieldFM,SlowfoodFM,EastlandFM]
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
        
        
        secondViewController.market=marketlist[row/2]
        
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
