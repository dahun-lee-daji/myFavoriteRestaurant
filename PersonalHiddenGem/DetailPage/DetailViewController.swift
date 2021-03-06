//
//  DetailViewController.swift
//  PersonalHiddenGem
//
//  Created by 이다훈 on 2020/11/18.
//  Copyright © 2020 FastCampus. All rights reserved.
//

import UIKit
import MapKit
import Foundation
import CoreData

class DetailViewController: UIViewController {
    
    @IBOutlet weak var shopName: UITextField!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodType: UISegmentedControl!
    @IBOutlet weak var foodReview: UISegmentedControl!
    let imagePicker = UIImagePickerController()
    var tempCurrentCoordinate : CLLocationCoordinate2D = .init()
    
    @IBAction func modifyFoodImage(_ sender: UIButton) {
        
        print("사진변경 눌림")
        let alert = UIAlertController(title: "원하는 동작을 선택", message: nil, preferredStyle: .actionSheet)
        let openAlbumAction = UIAlertAction(title: "사진 앨범", style: .default, handler: {(action) in self.openAlbum()})
        let openCameraAction = UIAlertAction(title: "사진 찍기", style: .default, handler: {(action) in self.openCamera()})
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(openAlbumAction)
        alert.addAction(openCameraAction)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveReview(_ sender: UIButton) {
        let reviewData : sPlace = .init(tempLatitude: tempCurrentCoordinate.latitude, tempLongitude: tempCurrentCoordinate.longitude, tempName: shopName.text!, tempReview: foodReview.selectedSegmentIndex, tempFoodType: sPlace.FoodType(rawValue: foodType.selectedSegmentIndex) ?? sPlace.FoodType.기타, tempFoodImage: foodImage.image!)
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "AnnoPlace", in: context)
        print(entity?.name ?? "엔티티 안잡아짐")
        
        if let entity = entity {
            let place = NSManagedObject(entity: entity, insertInto: context)
            place.setValue(reviewData.latitude, forKey: "latitude")
            place.setValue(reviewData.longitude, forKey: "longitude")
            place.setValue(reviewData.name, forKey: "name")
            place.setValue(reviewData.reviews, forKey: "reviews")
            place.setValue(reviewData.foodType.rawValue, forKey: "foodType")
            place.setValue(reviewData.foodImage, forKey: "foodImage")
        }
        
        /*
        do{
            try context.save()
        } catch  {
            print(error.localizedDescription)
            }
         */
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    func openAlbum() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: false, completion: nil)
    }
    
    func openCamera() {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: false, completion: nil)
    }
}

extension DetailViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        print("이미지 픽킹 완료")
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            foodImage.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
