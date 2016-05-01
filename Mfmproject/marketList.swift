//
//  marketList.swift
//  Mfmproject
//
//  Created by JiangLewei on 29/04/2016.
//  Copyright © 2016 Tony Qian. All rights reserved.
//

import UIKit

class marketList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sideMenu: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var marketlist:[Market]!
    
//    var marketsName = ["Carlton Farmer Market", "The University Of Melbourne", "Collingwood Children's Farm", "Coburg North Primary School", "Gasworks Arts Park", "Fairfield Primary School", "Slow Food Melbourne", "Eastland"]
//    
//    var marketsImage = [UIImage(named: "CarltonFM_Address_Logo_Purple.jpg"), UIImage(named: "UNI-MELB-WHITE-FM-400x400_0_0_1.jpg"), UIImage(named: "CWFM-220x165px.jpg"), UIImage(named: "CFM-220x165px.jpg"), UIImage(named: "GFM-220x165.jpg"), UIImage(named: "FFM-220x165px.jpg"), UIImage(named: "SFMFM_220x165.jpg"), UIImage(named: "Eastland-220x165.jpg")]

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
    
    func createObject()->[Market]{
        var CarltonFM=Market(name:"Carlton Farmer Market",titleimage:
            UIImage(named: "CarltonFM_Address_Logo_Purple.jpg"))
        
        var UnimelbFM=Market(name:"The University Of Melbourne",titleimage:UIImage(named: "UNI-MELB-WHITE-FM-400x400_0_0_1.jpg"))
        
        var CollingwoodFM=Market(name: "Collingwood Children's Farm", titleimage: UIImage(named: "CWFM-220x165px.jpg"))
        
        var CoburgNorthFM=Market(name: "Coburg North Primary School", titleimage: UIImage(named: "CFM-220x165px.jpg"))
        
        var GasworksFM=Market(name: "Gasworks Arts Park", titleimage: UIImage(named: "GFM-220x165.jpg"))
        
        var FairfieldFM=Market(name: "Fairfield Primary School", titleimage: UIImage(named: "FFM-220x165px.jpg"))
        
        var SlowfoodFM=Market(name:"Slow Food Melbourne",titleimage:UIImage(named: "SFMFM_220x165.jpg"))
        
        var EastlandFM=Market(name: "Eastland", titleimage: UIImage(named: "Eastland-220x165.jpg"))
        
        
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
            
        cell.marketImage.layer.cornerRadius = 20
        
        cell.marketImage.layer.masksToBounds = true
        
        cell.marketImage.image = marketlist[indexPath.row/2].markettitleimage
        
        cell.marketName.text = marketlist[indexPath.row/2].name
        
        cell.backgroundColor = UIColor.init(colorLiteralRed: 0.255, green: 0.153, blue: 0.102, alpha: 0.2)
            
        
        //set selected cell background color
        let backgroundView = UIView()
            
        backgroundView.backgroundColor = UIColor(red: 0.153, green: 0.122, blue: 0, alpha: 0.2)
        
        cell.selectedBackgroundView = backgroundView
        
        //cell corner radius
        cell.layer.cornerRadius = 20
        
        
        
        cell.clipsToBounds = true
            return cell} else {
        
            let cell = self.tableView.dequeueReusableCellWithIdentifier("spaceCell", forIndexPath: indexPath)
            
            cell.backgroundColor = UIColor.clearColor()
            
            cell.userInteractionEnabled = false
            
            return cell
            
        }
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
        
            return 80
        }else {
        
            return 20
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
