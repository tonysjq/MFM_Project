//
//  MarketAnnotation.swift
//  Mfmproject
//
//  Created by Shuaiji Qian on 27/04/2016.
//  Copyright © 2016 Tony Qian. All rights reserved.
//

import Foundation
import MapKit

class MarketAnnotation:NSObject,MKAnnotation{

var coordinate=CLLocationCoordinate2D()

    init(coordinate:CLLocationCoordinate2D)
    {
    self.coordinate=coordinate
    }

}