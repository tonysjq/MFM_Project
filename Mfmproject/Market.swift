//
//  Market.swift
//  Mfmproject
//
//  Created by Shuaiji Qian on 1/05/2016.
//  Copyright © 2016 Tony Qian. All rights reserved.
//

import Foundation
import MapKit
class Market{
    private var _name:String
    private var _markettitleimage:UIImage
    private var _marketlocation:String
    private var _marketDesc:String!
    private var _fbid:String!
    private var _fburl:String!
    private var _coordinates:CLLocationCoordinate2D!
    
    init(name:String,titleimage:UIImage,location:String,coordinates:CLLocationCoordinate2D)
    {self._name=name
     self._markettitleimage=titleimage
     self._marketlocation=location
     self._fbid="322229108842"
     self._fburl="https://www.facebook.com/MelbourneFarmersMarkets/"
     self._coordinates=coordinates
    }
    var name:String{
        get{
            return _name
        }
    }

    var coordinates:CLLocationCoordinate2D{
        get{
            return _coordinates
        }
    }
    var markettitleimage:UIImage?{
        get{
            return _markettitleimage
        }
    
    
    }
    
    
    var marketlocation:String{
        get{
            return _marketlocation
        }
      
    }
    
    var marketDecs:String{
        get{
            return _marketDesc
        }
        set(newDecs){
            _marketDesc=newDecs
        }
      
    }
    var fbid:String{
        get{
            return _fbid
        }
        set(newfbid){
            _fbid=newfbid
        }
    }
    var fburl:String{
        get{
            return _fburl
        }
        set(newfburl){
            _fburl=newfburl
        }

    }
    

}