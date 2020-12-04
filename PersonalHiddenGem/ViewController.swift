//
//  ViewController.swift
//  PersonalHiddenGem
//
//  Created by James Kim on 8/5/20.
//  Copyright © 2020 FastCampus. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet var appleMap : MKMapView!
    @IBOutlet var addAnnotationBtn : UIButton!
    let locationManager : CLLocationManager! = .init()
    var places: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 저장된 annotation을 불러오는 내용 필요.
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        getLocationAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        appleMap.isZoomEnabled = true
        appleMap.isPitchEnabled = true
        appleMap.isRotateEnabled = true
        appleMap.isScrollEnabled = true
        appleMap.showsUserLocation = true
        
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
    
    
    
    @IBAction func addReviewPoint(_ sender: UIButton){
        print("btn clicked")
        //annotation을 core||db에 저장하는 내용 필요.
        //일시적으로 현재 맵 중심에 annotation을 놓기.
        
        
        var currentPlace : Place = .init()
        
        let tempCurrentCoodinate :CLLocationCoordinate2D = .init(latitude: appleMap.centerCoordinate.latitude, longitude: appleMap.centerCoordinate.longitude)
        
        callDetailView(tempCurrentCoodinate)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = tempCurrentCoodinate
        annotation.title = "test"
        annotation.subtitle = "test"
        
        appleMap.addAnnotation(annotation)
        
        
    }
    
    
    @IBAction func moveToMyLocation(_ sender: UIButton) {
        
        appleMap.setCameraZoomRange(MKMapView.CameraZoomRange.init(maxCenterCoordinateDistance: 3000), animated: true)
        
        appleMap.setCenter(appleMap.userLocation.coordinate, animated: true)
    }
    
    
    func callDetailView(_ cooperate : CLLocationCoordinate2D){
        let detailStoryboard = UIStoryboard.init(name: "Detail", bundle: nil)
        guard let detailVC = detailStoryboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return}
        detailVC.tempCurrentCoordinate = cooperate
        
        present(detailVC, animated: true, completion: nil)
        
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

