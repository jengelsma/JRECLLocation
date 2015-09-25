//
//  CLLocationExtensions.swift
//
//  Created by Jonathan Engelsma on 9/24/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

import Foundation
import CoreLocation

/**
    Extends CLLocation in CoreLocation with some commonly used calculations.
*/
extension CLLocation {
    
    /**
        Compute bearing in degrees between two points (in radians).

        :param: point The point the bearing is being computed for.

        :returns: The computed bearing in degrees. 
    */
    func bearingToPoint(point:CLLocation) -> Double {
        var p1 = (self.coordinate.latitude, self.coordinate.longitude)
        var p2 = (point.coordinate.latitude, point.coordinate.longitude)
        var x = cos(p2.0) * sin(abs(p2.1 - p1.1))
        var y = cos(p1.0) * sin(p2.0) - sin(p1.0) * cos(p2.0) * cos(abs(p2.1 - p1.1))
        
        return atan2(x,y) * 180.0 / M_PI
    }
    
    
    /**
        Compute a destination coordinate based on a start coordinate, bearing, and distance.

        :param: withBearing The bearing (in decimal).
        :param: atDistance The distance to be traveled (in kilometers).

        :return: the destinataion coordinate. 
    */
    func findingPoint(withBearing: Double, atDistance: Double) -> CLLocation
    {
        let R = 6371.0
        
        // compute the coordinates in radians
        var p1 = (self.coordinate.latitude * M_PI / 180.0, self.coordinate.longitude * M_PI / 180.0)
        
        // compute angular distance
        var ad = atDistance / R
        var lat : Double = asin(sin(p1.0) * cos(ad) + cos(p1.0) * sin(ad) * cos(withBearing))
        var lon : Double = p1.1 + atan2(sin(withBearing) * sin(ad) * cos(p1.0), cos(ad) - sin(p1.0) * sin(lat))
        
        // create the CLLocation by converting from radians to decimal.
        return CLLocation(latitude: lat * 180.0 / M_PI, longitude: lon * 180.0 / M_PI)
    }
}