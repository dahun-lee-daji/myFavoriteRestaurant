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
    init(tempLatitude: CLLocationDegrees, tempLongitude: CLLocationDegrees, tempName: String, tempReview: Int, tempFoodType: FoodType, tempFoodImage: UIImage?) {
        
        latitude = tempLatitude
        longitude = tempLongitude
        name = tempName
        reviews = tempReview
        foodType = tempFoodType
        foodImage = tempFoodImage
    }
    init(tempLatitude: CLLocationDegrees, tempLongitude: CLLocationDegrees) {
        self.init(tempLatitude: tempLatitude, tempLongitude: tempLongitude, tempName: "", tempReview: 0, tempFoodType: FoodType.기타, tempFoodImage: nil)
    
    }
    init() {
        self.init(tempLatitude: CLLocationDegrees.init(), tempLongitude: CLLocationDegrees.init(), tempName: "", tempReview: 0, tempFoodType: FoodType.기타, tempFoodImage: nil)
    
    }
    
}
