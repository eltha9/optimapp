//
//  VoyageViewController.swift
//  optimapp
//
//  Created by Théa Dos Santos on 14/01/2020.
//  Copyright © 2020 Théa. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var mainMap: MKMapView!
    // location manager
    
    
    @IBAction func getLocation(_ sender: Any) {
        
        if
           CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            self.currentLocation = locManager.location
            debugPrint(currentLocation.coordinate.longitude)
            debugPrint(currentLocation.coordinate.latitude)
            
            
            
            
            let pinLocation = MKPointAnnotation()
            pinLocation.coordinate = CLLocationCoordinate2D( latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
            
            self.mainMap.addAnnotation(pinLocation)
            
            let region = MKCoordinateRegion(center: pinLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mainMap.setRegion(region, animated: true)
            
            self.startUpdatingLocation()
            
        }
        
        
    }
    var locManager = CLLocationManager()
    
    func startUpdatingLocation(){
        self.currentLocation = locManager.location
        debugPrint(currentLocation.coordinate.longitude)
        debugPrint(currentLocation.coordinate.latitude)
        
        
        
        
        let pinLocation = MKPointAnnotation()
        pinLocation.coordinate = CLLocationCoordinate2D( latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        
        self.mainMap.addAnnotation(pinLocation)
        
        let region = MKCoordinateRegion(center: pinLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mainMap.setRegion(region, animated: true)
        
        
    }
    

    
    //end location manager
    
    
    let buttonTypes: [String] = ["resto"
        ,"monuments"
        ,"insolite"
        ,"famille"
        ,"romantique"
        ,"decouverte"]
    
    @IBOutlet weak var goTo: UIButton!
    
    var placesList = [Place](){
        didSet{
            for place in self.placesList{
                    self.setPlaceMarker(place: place)
//                debugPrint(place)
            }
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "map_tab_icon"), tag: 2)
        
//        self.goTo.layer.cornerRadius = self.goTo.frame.width / 2
        
        let placesRequete = PlacesRequest(placeType: "resto",latitude: 48.845053, longitude:  2.433134)
        placesRequete.getPlaces {[weak self] result in
            switch result {
            case .failure(let error):
                print(error)

            case .success( let places ):
                self?.placesList = places

            }
        }
    }
    
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view.
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MapTopTableViewCell
        cell.content.text = buttonTypes[indexPath.row]
        return cell
    }
    
    
    
    
    func setPlaceMarker(place: Place){
        
        let pinPlace = MKPointAnnotation()
//        pinPlace.coordinate = CLLocationCoordinate2D( latitude: CLLocationDegrees(place.location.latitude), longitude: CLLocationDegrees(place.location.longitude))
        
        pinPlace.coordinate = CLLocationCoordinate2D( latitude: CLLocationDegrees(48.84588), longitude: CLLocationDegrees(2.4282708))
        pinPlace.title = place.name
//        self.mainMap.addAnn otation(pinPlace)
        debugPrint(place)
    }
}


//extension MapViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return buttonTypes.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: MapTopTableViewCell.identifier, for: indexPath) as! MapTopTableViewCell
//
//        cell.uniqCell = buttonTypes[indexPath.row]
//
//        return cell
//    }
//
//
//}
