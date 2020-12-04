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
        let reviewData : Place = .init(tempLatitude: tempCurrentCoordinate.latitude, tempLongitude: tempCurrentCoordinate.longitude, tempName: shopName.text!, tempReview: foodReview.selectedSegmentIndex, tempFoodType: Place.FoodType(rawValue: foodType.selectedSegmentIndex) ?? Place.FoodType.기타, tempFoodImage: foodImage.image!)
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
