//
//  Place.swift
//  PersonalHiddenGem
//
//  Created by James Kim on 8/5/20.
//  Copyright © 2020 FastCampus. All rights reserved.
//

import UIKit
import MapKit

struct Place {
    enum FoodType {
        case 양식
        case 일식
        case 중식
        case 한식
        case 기타
    }
    
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    
    let name: String
    // reviews 0~5점 사이의 인트값 입니다.
    var reviews: Int
    var foodType: FoodType
    var foodImage: UIImage?
    
    var cordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
}