//
//  ViewController.swift
//  PersonalHiddenGem
//
//  Created by James Kim on 8/5/20.
//  Copyright © 2020 FastCampus. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var appleMap : MKMapView!
    @IBOutlet var addAnnotationBtn : UIButton!
    let locationManager : CLLocationManager! = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        getLocationAuthorization()
        locationManager.startUpdatingLocation()
        appleMap.showsUserLocation = true
        
    }
    
    @IBAction func addAnnotation(_ sender: UIButton){
        print("btn clicked")
        
    }

    
    func getLocationAuthorization() {
        
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            // 위치 정보 권한 허용
            print("위치 정보 권한 허용 됨")
            
        case .denied :
            // 위치 정보 권한 거절.
            print("위치 정보 권한 거절 됨")
            locationManager.requestWhenInUseAuthorization()
            
        default:
            // 위치 정보 허용 결정을 아직 내리지 않음. notDetermined, restricted
            print("위치 정보 권한 요청")
            locationManager.requestWhenInUseAuthorization()
        }
    }

}

