# JRECLLocation
Some useful Swift extensions to the iOS CLLocation class. This Swift extension adds the following methods to CLLocation:

 * func bearingToPoint(point:CLLocation) -> Double : Computes the bearing to the given point. 
 * func findingPoint(withBearing: Double, atDistance: Double) -> CLLocation : Computes a destination point that will be arrived at when traveling from the origination with the given distance/bearing. 
 
## Requirements
These extensions work with iOS7 and above and depend on the following frameworks:

 * Foundation.framework
 * CoreLocation.framework
 
### Usage
To use JRECLLocation in your project:

1. Clone the source to your desired local directory.
2. Open your project in Xcode and drag CLLocationExtensions.swift into your project.
3. The above methods will be available on objects of type CLLocation. 

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE). 
  
